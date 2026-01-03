// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_project_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentProjectViewModel _$InvestmentProjectViewModelFromJson(
  Map<String, dynamic> json,
) => InvestmentProjectViewModel(
  id: json['id'] as String?,
  commodity: json['commodity'] as String?,
  farmerName: json['farmerName'] as String?,
  targetAmount: json['targetAmount'] as String?,
);

Map<String, dynamic> _$InvestmentProjectViewModelToJson(
  InvestmentProjectViewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'commodity': instance.commodity,
  'farmerName': instance.farmerName,
  'targetAmount': instance.targetAmount,
};
