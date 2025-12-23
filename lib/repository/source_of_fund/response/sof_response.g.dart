// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SofResponse _$SofResponseFromJson(Map<String, dynamic> json) => SofResponse(
  amount: json['amount'] as String?,
  userId: json['userId'] as String?,
  walletAddress: json['walletAddress'] as String?,
);

Map<String, dynamic> _$SofResponseToJson(SofResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'userId': instance.userId,
      'walletAddress': instance.walletAddress,
    };
