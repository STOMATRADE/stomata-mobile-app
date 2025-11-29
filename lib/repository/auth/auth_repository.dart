import 'package:stomata_app/core/config/firebase/auth_services.dart';
import 'package:stomata_app/repository/auth/response/auth_login_response.dart';
import 'package:stomata_app/repository/auth/response/auth_logout_response.dart';

// NEED ENHANCE
class AuthRepository {
  static AuthRepository? _instance;

  AuthRepository._internal() {
    _instance = this;
  }

  factory AuthRepository() => _instance ?? AuthRepository._internal();

  Future<AuthLoginResponse> loginWithGoogle() async {
    AuthLoginResponse loginResponse = AuthLoginResponse();
    try {
      var authData = await AuthService().signInWithGoogle();

      if (authData != null) {
        loginResponse.errorMessage = "";
        loginResponse.isError = false;
        loginResponse.userData = authData;
      } else {
        loginResponse.errorMessage = "login failed";
        loginResponse.isError = true;
      }

      return loginResponse;
    } catch (e) {
      loginResponse.errorMessage = e.toString();
      loginResponse.isError = true;

      return loginResponse;
    }
  }

  Future<AuthLogoutResponse> logoutAccount() async {
    AuthLogoutResponse logoutResponse = AuthLogoutResponse();
    try {
      var logoutData = await AuthService().signOut();

      if (logoutData == null) {
        logoutResponse.isError = true;
        logoutResponse.errorMessage = "Failed Logout";
      } else {
        logoutResponse.isError = false;
        logoutResponse.errorMessage = "";
      }

      return logoutResponse;
    } catch (e) {
      logoutResponse.isError = true;
      logoutResponse.errorMessage = e.toString();

      return logoutResponse;
    }
  }
}
