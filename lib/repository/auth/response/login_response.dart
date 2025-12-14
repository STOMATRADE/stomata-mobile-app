import 'package:stomata_app/repository/auth/response/user_model.dart';

class LoginResponse {
  final String accessToken;
  final UserModel user;

  LoginResponse({required this.accessToken, required this.user});
}
