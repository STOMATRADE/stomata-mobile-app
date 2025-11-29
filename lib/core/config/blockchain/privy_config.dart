import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:privy_flutter/privy_flutter.dart';
import 'package:stomata_app/core/config/blockchain/model/auth_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/model/verify_privy_model.dart';
import 'package:stomata_app/core/config/firebase/firebase_remote_config_utils.dart';
import 'package:stomata_app/core/utils/logging.dart';

class PrivyConfigUtils {
  _setupPrivyConfig() async {
    FirebaseRemoteConfig remoteConfigUtils = FirebaseRemoteConfigUtils()
        .getRemoteConfig();

    var privyConfig = PrivyConfig(
      appClientId: remoteConfigUtils.getString("privyAppClientId"),
      appId: remoteConfigUtils.getString("privyAppId"),
      logLevel: PrivyLogLevel.verbose,
    );

    return privyConfig;
  }

  Privy _getPrivyConfig() {
    final privy = Privy.init(config: _setupPrivyConfig());
    return privy;
  }

  Future<AuthPrivyModel> loginWithEmail(String email) async {
    AuthPrivyModel data = AuthPrivyModel();

    var privy = _getPrivyConfig();
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
  }

  Future<VerifyPrivyModel> verifyCode(String email, String code) async {
    VerifyPrivyModel data = VerifyPrivyModel();

    var privy = _getPrivyConfig();
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
