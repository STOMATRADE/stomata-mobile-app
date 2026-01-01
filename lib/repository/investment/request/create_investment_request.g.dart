// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_investment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInvestmentRequest _$CreateInvestmentRequestFromJson(
  Map<String, dynamic> json,
) => CreateInvestmentRequest(
  userId: json['userId'] as String?,
  projectId: json['projectId'] as String?,
  amount: json['amount'] as String?,
);

Map<String, dynamic> _$CreateInvestmentRequestToJson(
  CreateInvestmentRequest instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'projectId': instance.projectId,
  'amount': instance.amount,
};
