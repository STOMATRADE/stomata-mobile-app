import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/domain/request/domain_request.dart';
import 'package:stomata_app/repository/domain/response/domain_response.dart';
import 'package:stomata_app/repository/domain/view/domain_view_model.dart';

class DomainRepository extends BaseServices {
  Future<BaseResponseModel> domainExecute({
    required DomainRequest param,
  }) async {
    try {
      BaseResponseModel? baseResponseModel;

      final String dummyRes = await rootBundle.loadString(
        DummyData.domainStatus,
      );
      final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

      await Future.delayed(const Duration(seconds: 1));

      baseResponseModel = BaseResponseModel.fromJson(jsonMap);

      if (baseResponseModel.data != null) {
        DomainResponse domainResponse = DomainResponse.fromJson(
          baseResponseModel.data,
        );

        DomainViewModel domainViewModel = DomainViewModel()
          ..status = domainResponse.status;

        baseResponseModel.data = domainViewModel;

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
