// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentProjectResponse _$InvestmentProjectResponseFromJson(
  Map<String, dynamic> json,
) => InvestmentProjectResponse(
  id: json['id'] as String?,
  commodity: json['commodity'] as String?,
  farmerName: json['farmerName'] as String?,
  targetAmount: json['targetAmount'] as String?,
);

Map<String, dynamic> _$InvestmentProjectResponseToJson(
  InvestmentProjectResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'commodity': instance.commodity,
  'farmerName': instance.farmerName,
  'targetAmount': instance.targetAmount,
};
