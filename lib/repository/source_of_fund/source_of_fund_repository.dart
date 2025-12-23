import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/source_of_fund/response/sof_response.dart';
import 'package:stomata_app/repository/source_of_fund/view/sof_view_model.dart';

class SourceOfFundRepository extends BaseServices with CacheManager {
  Future<BaseResponseModel> getSourceOfFund(String userId) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.sourceOfFund,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await getApi(
          endpoint: Endpoint.getSourceOfFundEndpoint(userId),
        );

        printLog("data: ${response.data}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      if (baseResponseModel.data != null) {
        SofResponse sofResponse = SofResponse.fromJson(baseResponseModel.data);

        SofViewModel sofViewModel = SofViewModel(
          amount: sofResponse.amount,
          userId: sofResponse.userId,
          walletAddress: sofResponse.walletAddress,
        );

        baseResponseModel.data = sofViewModel;

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
