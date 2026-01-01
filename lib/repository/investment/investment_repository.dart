import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/investment/request/create_investment_request.dart';

class InvestmentRepository extends BaseServices with CacheManager {
  Future<BaseResponseModel> createInvestment(
    CreateInvestmentRequest param,
  ) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.createInvestment,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await postApi(
          params: param.toJson(),
          endpoint: Endpoint.createInvestment,
        );

        printLog("data: ${jsonEncode(response.data)}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      return baseResponseModel;
    } catch (e) {
      printLog("error : $e");
      rethrow;
    }
  }
}
