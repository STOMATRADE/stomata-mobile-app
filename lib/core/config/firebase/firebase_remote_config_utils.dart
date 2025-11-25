import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigUtils {
  FirebaseRemoteConfig getRemoteConfig() {
    final remoteConfig = FirebaseRemoteConfig.instance;

    return remoteConfig;
  }

  configSettings() async {
    var config = getRemoteConfig();

    await config.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
  }
}
