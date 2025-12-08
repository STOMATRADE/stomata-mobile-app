import 'package:collection/collection.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:privy_flutter/privy_flutter.dart';
import 'package:stomata_app/core/config/blockchain/model/auth_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/model/verify_privy_model.dart';
import 'package:stomata_app/core/config/firebase/firebase_remote_config_utils.dart';
import 'package:stomata_app/core/utils/logging.dart';

class PrivyConfigUtils {
  Future<PrivyConfig> _setupPrivyConfig() async {
    FirebaseRemoteConfig remoteConfigUtils = FirebaseRemoteConfigUtils()
        .getRemoteConfig();

    var privyConfig = PrivyConfig(
      appClientId: "client-WY6TLxLxgY3eeVH4dPW8bNrkH399KSQifKcrz2QKAHjDy",
      appId: "cmielo7me00hjl50dwzy9uy08",
      logLevel: PrivyLogLevel.verbose,
    );

    printLog("privyAppId: ${privyConfig.appId}");
    printLog("appClientId: ${privyConfig.appClientId}");

    return privyConfig;
  }

  Future<Privy> _getPrivyConfig() async {
    var config = await _setupPrivyConfig();

    final privy = Privy.init(config: config);
    return privy;
  }

  Future<AuthPrivyModel> loginWithEmail(String email) async {
    AuthPrivyModel data = AuthPrivyModel();

    try {
      var privy = await _getPrivyConfig();
      final sendResult = await privy.email.sendCode(email);
      sendResult.fold(
        onSuccess: (ok) {
          printLog("Code sent to $email");
          data.message = "Success";
          data.success = true;
        },
        onFailure: (err) {
          printLog("Failed to send code: ${err.message}");

          data.message = err.message;
          data.success = false;
        },
      );

      return data;
    } catch (e) {
      printLog("privy Error: $e");
      data.message = e.toString();
      data.success = false;

      return data;
    }
  }

  Future<VerifyPrivyModel> verifyCode(String email, String code) async {
    printLog("email: $email");
    printLog("code: $code");

    VerifyPrivyModel data = VerifyPrivyModel();

    try {
      var privy = await _getPrivyConfig();
      final loginResult = await privy.email.loginWithCode(
        email: email,
        code: code,
      );
      loginResult.fold(
        onSuccess: (privyUser) {
          printLog("Login succeeded, user id: ${privyUser.id}");

          data.message = "success";
          data.privyUser = privyUser;
          data.success = true;
        },
        onFailure: (err) {
          printLog("Login failed: ${err.message}");

          data.message = err.message;
          data.success = false;
        },
      );
    } catch (e) {
      printLog("privy Error: $e");
      data.message = e.toString();
      data.success = false;
    }

    return data;
  }

  Future<AuthPrivyModel> privyLogout() async {
    AuthPrivyModel data = AuthPrivyModel();

    try {
      var privy = await _getPrivyConfig();
      await privy.logout();

      data.message = "Logout Success";
      data.success = true;
    } catch (e) {
      printLog("error: $e");
      data.message = e.toString();
      data.success = false;

      rethrow;
    }

    return data;
  }

  Future<PrivyUser?> _getCurrentUser() async {
    try {
      final privy = await _getPrivyConfig();
      final user = await privy.getUser();
      return user;
    } catch (e) {
      printLog("Error getUser: $e");
      return null;
    }
  }

  // Future<String?> getEmailAcc() async {
  //   final user = await _getCurrentUser();
  //   if (user == null) {
  //     printLog("User not authenticated");
  //     return null;
  //   }

  //   try {
  //     // linkedAccounts adalah List<dynamic> (accounts)
  //     final emailAcc = user.linkedAccounts.firstWhere(
  //       (acc) => acc.type == 'email',
  //       orElse: () => null,
  //     );
  //     final email = emailAcc
  //         ?.address; // di JS docs: account.address :contentReference[oaicite:3]{index=3}
  //     printLog("Privy Email: $email");
  //     return email;
  //   } catch (e) {
  //     printLog("Cannot get email: $e");
  //     return null;
  //   }
  // }
}
