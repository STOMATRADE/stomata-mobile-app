import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/global_query_param/pagination_query.dart';
import 'package:stomata_app/repository/project/response/detail/project_detail_response.dart';
import 'package:stomata_app/repository/project/response/list/project_list_response.dart';
import 'package:stomata_app/repository/project/view/detail/project_detail_view_model.dart';
import 'package:stomata_app/repository/project/view/list/project_item_view_model.dart';
import 'package:stomata_app/repository/project/view/list/project_list_view_model.dart';

class ProjectRepository extends BaseServices with CacheManager {
  Future<BaseResponseModel> getOngoingProjects(PaginationQuery query) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.ongoingProject,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await getApi(
          endpoint: Endpoint.ongoingProject,
          queryParams: query.toJson(),
        );

        printLog("data: ${response.data}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      if (baseResponseModel.data != null) {
        ProjectListResponse projectListResponse = ProjectListResponse.fromJson(
          baseResponseModel.data,
        );

        ProjectListViewModel projectListViewModel = ProjectListViewModel();
        List<ProjectItemViewModel> listProjectItems = [];

        projectListResponse.items?.forEach((projectItemResponse) {
          ProjectItemViewModel projectItemViewModel = ProjectItemViewModel();

          projectItemViewModel.projectId = projectItemResponse.projectId;
          projectItemViewModel.projectName = projectItemResponse.projectName;
          projectItemViewModel.fundingPercentage =
              projectItemResponse.fundingPercentage;
          projectItemViewModel.fundingPrice = projectItemResponse.fundingPrice;
          projectItemViewModel.image = projectItemResponse.image;
          projectItemViewModel.investors = projectItemResponse.investors;
          projectItemViewModel.margin = projectItemResponse.margin;
          projectItemViewModel.projectCompany =
              projectItemResponse.projectCompany;
          projectItemViewModel.status = projectItemResponse.status;
          projectItemViewModel.totalFunding = projectItemResponse.totalFunding;

          listProjectItems.add(projectItemViewModel);
        });

        projectListViewModel.items = listProjectItems;
        projectListViewModel.limit = projectListResponse.limit;
        projectListViewModel.page = projectListResponse.page;
        projectListViewModel.total = projectListResponse.total;
        projectListViewModel.totalPages = projectListResponse.totalPages;

        baseResponseModel.data = projectListViewModel;

        return baseResponseModel;
      } else {
        return baseResponseModel;
      }
    } catch (e) {
      printLog("error : $e");
      rethrow;
    }
  }

  Future<BaseResponseModel> getProjectDetail(String projectId) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.projectDetail,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await getApi(
          endpoint: Endpoint.projectDetail(projectId),
        );

        printLog("data: ${response.data}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      if (baseResponseModel.data != null) {
        ProjectDetailResponse projectDetailResponse =
            ProjectDetailResponse.fromJson(baseResponseModel.data);

        ProjectDetailViewModel projectDetailViewModel =
            ProjectDetailViewModel();

        projectDetailViewModel.projectId = projectDetailResponse.projectId;
        projectDetailViewModel.projectName = projectDetailResponse.projectName;
        projectDetailViewModel.collectorName =
            projectDetailResponse.collectorName;
        projectDetailViewModel.farmerName = projectDetailResponse.farmerName;
        projectDetailViewModel.volume = projectDetailResponse.volume;
        projectDetailViewModel.commodity = projectDetailResponse.commodity;
        projectDetailViewModel.submissionDate =
            projectDetailResponse.submissionDate;
        projectDetailViewModel.deliveryDate =
            projectDetailResponse.deliveryDate;

        double projectPrice = Helpers.formatTokenAmount(
          amount: BigInt.parse(projectDetailResponse.projectPrice ?? "0"),
          decimals: Helpers().getDecimals(),
        );

        double fundingPrice = Helpers.formatTokenAmount(
          amount: BigInt.parse(projectDetailResponse.fundingPrice ?? "0"),
          decimals: Helpers().getDecimals(),
        );

        double currentFundingPrice = Helpers.formatTokenAmount(
          amount: BigInt.parse(
            projectDetailResponse.currentFundingPrice ?? "0",
          ),
          decimals: Helpers().getDecimals(),
        );

        projectDetailViewModel.projectPrice = Helpers.formatAmount(
          projectPrice.toInt(),
        ).toString();

        projectDetailViewModel.fundingPrice = Helpers.formatAmount(
          fundingPrice.toInt(),
        ).toString();

        projectDetailViewModel.currentFundingPrice = Helpers.formatAmount(
          currentFundingPrice.toInt(),
        ).toString();

        projectDetailViewModel.returnInvestmentRate =
            projectDetailResponse.returnInvestmentRate;
        projectDetailViewModel.investors = projectDetailResponse.investors;
        projectDetailViewModel.status = projectDetailResponse.status;
        projectDetailViewModel.fundingPercentage =
            projectDetailResponse.fundingPercentage;
        projectDetailViewModel.image = projectDetailResponse.image;
        projectDetailViewModel.landAddress = projectDetailResponse.landAddress;
        projectDetailViewModel.gradeQuality =
            projectDetailResponse.gradeQuality;

        baseResponseModel.data = projectDetailViewModel;

        return baseResponseModel;
      } else {
        return baseResponseModel;
      }
    } catch (e) {
      printLog("error : $e");
      rethrow;
    }
  }
}
