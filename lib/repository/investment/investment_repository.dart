import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/investment/request/create_investment_request.dart';
import 'package:stomata_app/repository/investment/response/create_investment_response.dart';
import 'package:stomata_app/repository/investment/view/create_investment_view_model.dart';
import 'package:stomata_app/repository/investment/view/investment_project_view_model.dart';

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

      if (baseResponseModel.data != null) {
        CreateInvestmentResponse createInvestmentResponse =
            CreateInvestmentResponse.fromJson(baseResponseModel.data);

        InvestmentProjectViewModel investmentProject =
            InvestmentProjectViewModel()
              ..commodity = createInvestmentResponse.project?.commodity
              ..farmerName = createInvestmentResponse.project?.farmerName
              ..id = createInvestmentResponse.project?.id
              ..targetAmount = createInvestmentResponse.project?.targetAmount;

        CreateInvestmentViewModel createInvestmentViewModel =
            CreateInvestmentViewModel()
              ..amount = createInvestmentResponse.amount
              ..id = createInvestmentResponse.id
              ..investedAt = createInvestmentResponse.investedAt
              ..message = createInvestmentResponse.message
              ..receiptTokenId = createInvestmentResponse.receiptTokenId
              ..project = investmentProject;

        baseResponseModel.data = createInvestmentViewModel;

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
