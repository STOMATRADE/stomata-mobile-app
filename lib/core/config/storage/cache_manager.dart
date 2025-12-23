import 'package:get_storage/get_storage.dart';
import 'package:stomata_app/core/config/storage/cache_key.dart';
import 'package:stomata_app/repository/auth/view/login_view_model.dart';

mixin CacheManager {
  final GetStorage storage = GetStorage();

  Future setLoginStatus(bool status) async {
    await storage.write(CacheManagerKey.loginStatus.name, status);
  }

  Future<bool> getLoginStatus() async {
    bool status = storage.read(CacheManagerKey.loginStatus.name) ?? false;
    return status;
  }

  Future setLoginData({required LoginViewModel data}) async {
    await storage.write(CacheManagerKey.loginData.name, data);
  }

  Future<LoginViewModel> getLoginData() async {
    LoginViewModel data =
        storage.read(CacheManagerKey.loginData.name) ?? LoginViewModel();
    return data;
  }

  Future setBearerToken({required String jwt}) async {
    await storage.write(CacheManagerKey.bearerToken.name, jwt);
  }

  Future<String> getBearerToken() async {
    String bearerToken = storage.read(CacheManagerKey.bearerToken.name) ?? "";
    return bearerToken;
  }
}
