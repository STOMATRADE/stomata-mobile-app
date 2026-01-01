// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentRequest _$InvestmentRequestFromJson(Map<String, dynamic> json) =>
    InvestmentRequest(
      userId: json['userId'] as String?,
      projectId: json['projectId'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$InvestmentRequestToJson(InvestmentRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'projectId': instance.projectId,
      'amount': instance.amount,
    };
