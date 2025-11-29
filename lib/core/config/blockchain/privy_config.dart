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
    VerifyPrivyModel data = VerifyPrivyModel();

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

    return data;
  }
}
