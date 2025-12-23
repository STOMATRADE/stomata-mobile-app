import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/portofolio/response/portofolio_amount_response.dart';
import 'package:stomata_app/repository/portofolio/view/portofolio_amount_view_model.dart';

class PortofolioRepository extends BaseServices with CacheManager {
  Future<BaseResponseModel> getTotalAsset(String userId) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.portofolioAmmount,
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
}
