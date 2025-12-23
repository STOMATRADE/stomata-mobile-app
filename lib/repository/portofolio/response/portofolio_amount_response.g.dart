// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_amount_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortofolioAmountResponse _$PortofolioAmountResponseFromJson(
  Map<String, dynamic> json,
) => PortofolioAmountResponse(
  amount: json['amount'] as String?,
  returnAmount: json['returnAmount'] as String?,
  percentage: (json['percentage'] as num?)?.toInt(),
  userId: json['userId'] as String?,
  totalInvested: json['totalInvested'] as String?,
  totalProfit: json['totalProfit'] as String?,
);

Map<String, dynamic> _$PortofolioAmountResponseToJson(
  PortofolioAmountResponse instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'returnAmount': instance.returnAmount,
  'percentage': instance.percentage,
  'userId': instance.userId,
  'totalInvested': instance.totalInvested,
  'totalProfit': instance.totalProfit,
};
