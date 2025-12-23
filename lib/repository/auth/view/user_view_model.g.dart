// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserViewModel _$UserViewModelFromJson(Map<String, dynamic> json) =>
    UserViewModel(
      id: json['id'] as String?,
      walletAddress: json['walletAddress'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserViewModelToJson(UserViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'walletAddress': instance.walletAddress,
      'role': instance.role,
    };
