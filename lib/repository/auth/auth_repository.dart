import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/dummy_data/dummy_data.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/auth/request/login_request.dart';
import 'package:stomata_app/repository/auth/response/login_response.dart';
import 'package:stomata_app/repository/auth/view/login_view_model.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';

class AuthRepository extends BaseServices with CacheManager {
  Future<BaseResponseModel> login({required LoginRequest param}) async {
    try {
      bool useDummyData = await getDummyData();

      BaseResponseModel? baseResponseModel;

      if (useDummyData) {
        final String dummyRes = await rootBundle.loadString(
          DummyData.authVerify,
        );
        final Map<String, dynamic> jsonMap = jsonDecode(dummyRes);

        await Future.delayed(const Duration(seconds: 1));

        baseResponseModel = BaseResponseModel.fromJson(jsonMap);
      } else {
        var response = await postApi(
          params: param.toJson(),
          endpoint: Endpoint.login,
        );

        printLog("data: ${response.data}");

        baseResponseModel = BaseResponseModel.fromJson(response.data);
      }

      if (baseResponseModel.data != null) {
        LoginResponse responseData = LoginResponse.fromJson(
          baseResponseModel.data,
        );

        LoginViewModel loginViewModel = LoginViewModel();
        UserViewModel userViewModel = UserViewModel();

        userViewModel.id = responseData.user.id;
        userViewModel.role = responseData.user.role;
        userViewModel.walletAddress = responseData.user.walletAddress;

        loginViewModel.accessToken = responseData.accessToken;
        loginViewModel.user = userViewModel;

        baseResponseModel.data = loginViewModel;

        return baseResponseModel;
      } else {
        return baseResponseModel;
      }
    } catch (e) {
      printLog("error : $e");
      rethrow;
    }
  }

  // Future<AuthLogoutResponse> logoutAccount() async {}
}
