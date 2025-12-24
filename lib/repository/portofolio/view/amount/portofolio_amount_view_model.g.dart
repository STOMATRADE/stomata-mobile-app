// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_amount_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortofolioAmountViewModel _$PortofolioAmountViewModelFromJson(
  Map<String, dynamic> json,
) => PortofolioAmountViewModel(
  amount: json['amount'] as String?,
  returnAmount: json['returnAmount'] as String?,
  percentage: (json['percentage'] as num?)?.toInt(),
  userId: json['userId'] as String?,
  totalInvested: json['totalInvested'] as String?,
  totalProfit: json['totalProfit'] as String?,
);

Map<String, dynamic> _$PortofolioAmountViewModelToJson(
  PortofolioAmountViewModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'returnAmount': instance.returnAmount,
  'percentage': instance.percentage,
  'userId': instance.userId,
  'totalInvested': instance.totalInvested,
  'totalProfit': instance.totalProfit,
};
