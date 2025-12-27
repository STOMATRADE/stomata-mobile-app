import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/global_query_param/pagination_query.dart';
import 'package:stomata_app/repository/project/response/project_list_response.dart';
import 'package:stomata_app/repository/project/view/project_item_view_model.dart';
import 'package:stomata_app/repository/project/view/project_list_view_model.dart';

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
}
