// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  walletAddress: json['walletAddress'] as String,
  signature: json['signature'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'walletAddress': instance.walletAddress,
      'signature': instance.signature,
      'message': instance.message,
    };
