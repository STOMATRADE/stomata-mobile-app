// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginViewModel _$LoginViewModelFromJson(Map<String, dynamic> json) =>
    LoginViewModel(
      accessToken: json['accessToken'] as String,
      user: UserViewModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginViewModelToJson(LoginViewModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'user': instance.user,
    };
