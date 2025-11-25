import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:privy_flutter/privy_flutter.dart';
import 'package:stomata_app/core/config/firebase/firebase_remote_config_utils.dart';

class PrivyConfigUtils {
  setupPrivyConfig() async {
    FirebaseRemoteConfig remoteConfigUtils = FirebaseRemoteConfigUtils()
        .getRemoteConfig();

    var privyConfig = PrivyConfig(
      appClientId: remoteConfigUtils.getString("privyAppClientId"),
      appId: remoteConfigUtils.getString("privyAppId"),
      logLevel: PrivyLogLevel.verbose,
    );

    return privyConfig;
  }

  Privy getPrivyConfig() {
    final privy = Privy.init(config: setupPrivyConfig());
    return privy;
  }
}
