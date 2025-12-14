import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_view_model.g.dart';

@JsonSerializable()
class LoginViewModel {
  String? accessToken;
  UserViewModel? user;

  LoginViewModel({this.accessToken, this.user});

  factory LoginViewModel.fromJson(Map<String, dynamic> json) =>
      _$LoginViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginViewModelToJson(this);
}
