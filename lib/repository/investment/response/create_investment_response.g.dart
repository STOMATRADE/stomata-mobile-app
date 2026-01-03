// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_investment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInvestmentResponse _$CreateInvestmentResponseFromJson(
  Map<String, dynamic> json,
) => CreateInvestmentResponse(
  id: json['id'] as String?,
  amount: json['amount'] as String?,
  receiptTokenId: (json['receiptTokenId'] as num?)?.toInt(),
  message: json['message'] as String?,
  investedAt: json['investedAt'] == null
      ? null
      : DateTime.parse(json['investedAt'] as String),
  project: json['project'] == null
      ? null
      : InvestmentProjectResponse.fromJson(
          json['project'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CreateInvestmentResponseToJson(
  CreateInvestmentResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'receiptTokenId': instance.receiptTokenId,
  'message': instance.message,
  'investedAt': instance.investedAt?.toIso8601String(),
  'project': instance.project,
};
