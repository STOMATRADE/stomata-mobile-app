import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigUtils {
  Future<FirebaseRemoteConfig> getRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 5),
      ),
    );

    await remoteConfig.fetchAndActivate();

    return remoteConfig;
  }
}
