import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/portofolio/response/amount/portofolio_amount_response.dart';
import 'package:stomata_app/repository/portofolio/response/detail/portofolio_detail_response.dart';
import 'package:stomata_app/repository/portofolio/response/summary/portofolio_summary_response.dart';
import 'package:stomata_app/repository/portofolio/view/amount/portofolio_amount_view_model.dart';
import 'package:stomata_app/repository/portofolio/view/detail/portofolio_detail_view_model.dart';
import 'package:stomata_app/repository/portofolio/view/summary/portofolio_item_view_model.dart';
import 'package:stomata_app/repository/portofolio/view/summary/portofolio_summary_view_model.dart';

class PortofolioRepository extends BaseServices with CacheManager {
  Future<BaseResponseModel> getTotalAsset(String userId) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.portofolioAmount,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await getApi(
          endpoint: Endpoint.getUserPortofolioAmount(userId),
        );

        printLog("data: ${response.data}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      if (baseResponseModel.data != null) {
        PortofolioAmountResponse portoResponse =
            PortofolioAmountResponse.fromJson(baseResponseModel.data);

        PortofolioAmountViewModel portoViewModel = PortofolioAmountViewModel();
        portoViewModel.amount = portoResponse.amount;
        portoViewModel.returnAmount = portoResponse.returnAmount;
        portoViewModel.percentage = portoResponse.percentage;
        portoViewModel.userId = portoResponse.userId;
        portoViewModel.totalInvested = portoResponse.totalInvested;
        portoViewModel.totalProfit = portoResponse.totalProfit;

        baseResponseModel.data = portoViewModel;

        return baseResponseModel;
      } else {
        return baseResponseModel;
      }
    } catch (e) {
      printLog("error : $e");
      rethrow;
    }
  }

  Future<BaseResponseModel> getPortofolioSummary(String userId) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.portofolioSummary,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await getApi(
          endpoint: Endpoint.getUserPortoSummary(userId),
        );

        printLog("data: ${response.data}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      if (baseResponseModel.data != null) {
        PortofolioSummaryResponse portofolioSummaryResponse =
            PortofolioSummaryResponse.fromJson(baseResponseModel.data);

        printLog("response: ${jsonEncode(portofolioSummaryResponse)}");

        List<PortofolioItemViewModel> listPortofolio = [];

        portofolioSummaryResponse.investments?.forEach((element) {
          PortofolioItemViewModel data = PortofolioItemViewModel();
          data.id = element.id;
          data.projectId = element.projectId;
          data.projectName = element.projectName;
          data.farmerName = element.farmerName;
          data.amount = element.amount;
          data.receiptTokenId = element.receiptTokenId;
          data.investedAt = element.investedAt;
          data.profitClaimed = element.profitClaimed;
          data.profitClaimsCount = element.profitClaimsCount;
          data.image = element.image;
          data.collectorName = element.collectorName;
          data.cumulativeAsset = element.cumulativeAsset;
          data.returnAsset = element.returnAsset;
          data.margin = element.margin;
          data.fundingPrice = element.fundingPrice;
          data.totalFunding = element.totalFunding;

          listPortofolio.add(data);
        });

        PortofolioSummaryViewModel portofolioSummaryViewModel =
            PortofolioSummaryViewModel()
              ..activeInvestments = portofolioSummaryResponse.activeInvestments
              ..avgRoi = portofolioSummaryResponse.avgRoi
              ..completedInvestments =
                  portofolioSummaryResponse.completedInvestments
              ..createdAt = portofolioSummaryResponse.createdAt
              ..deleted = portofolioSummaryResponse.deleted
              ..id = portofolioSummaryResponse.id
              ..investments = listPortofolio
              ..lastCalculatedAt = portofolioSummaryResponse.lastCalculatedAt
              ..totalClaimed = portofolioSummaryResponse.totalClaimed
              ..totalInvested = portofolioSummaryResponse.totalInvested
              ..totalProfit = portofolioSummaryResponse.totalProfit
              ..updatedAt = portofolioSummaryResponse.updatedAt
              ..userId = portofolioSummaryResponse.userId;

        baseResponseModel.data = portofolioSummaryViewModel;

        return baseResponseModel;
      } else {
        return baseResponseModel;
      }
    } catch (e) {
      printLog("error : $e");
      rethrow;
    }
  }

  Future<BaseResponseModel> getPortofolioDetail({
    required String userId,
    required String projectId,
  }) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.portofolioDetail,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await getApi(
          endpoint: Endpoint.getPortofolioDetail(
            userId: userId,
            projectId: projectId,
          ),
        );

        printLog("data: ${response.data}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      if (baseResponseModel.data != null) {
        PortofolioDetailResponse portofolioDetailResponse =
            PortofolioDetailResponse.fromJson(baseResponseModel.data);

        PortofolioDetailViewModel
        portofolioDetailViewModel = PortofolioDetailViewModel()
          ..assets = portofolioDetailResponse.assets
          ..collectorName = portofolioDetailResponse.collectorName
          ..commodity = portofolioDetailResponse.commodity
          ..cumulativeAsset = portofolioDetailResponse.cumulativeAsset
          ..currentFundingPrice = portofolioDetailResponse.currentFundingPrice
          ..deliveryDate = portofolioDetailResponse.deliveryDate
          ..farmerName = portofolioDetailResponse.farmerName
          ..fundingPercentage = portofolioDetailResponse.fundingPercentage
          ..fundingPrice = portofolioDetailResponse.fundingPrice
          ..gradeQuality = portofolioDetailResponse.gradeQuality
          ..image = portofolioDetailResponse.image
          ..investors = portofolioDetailResponse.investors
          ..landAddress = portofolioDetailResponse.landAddress
          ..projectId = portofolioDetailResponse.projectId
          ..projectName = portofolioDetailResponse.projectName
          ..projectPrice = portofolioDetailResponse.projectPrice
          ..returnInvestmentRate = portofolioDetailResponse.returnInvestmentRate
          ..returnRate = portofolioDetailResponse.returnRate
          ..status = portofolioDetailResponse.status
          ..submissionDate = portofolioDetailResponse.submissionDate
          ..volume = portofolioDetailResponse.volume
          ..welcomeReturn = portofolioDetailResponse.welcomeReturn;

        baseResponseModel.data = portofolioDetailViewModel;

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
