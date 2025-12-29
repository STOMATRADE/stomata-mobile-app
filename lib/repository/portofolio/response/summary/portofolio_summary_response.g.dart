// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortofolioSummaryResponse _$PortofolioSummaryResponseFromJson(
  Map<String, dynamic> json,
) => PortofolioSummaryResponse(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  totalInvested: json['totalInvested'] as String?,
  totalProfit: json['totalProfit'] as String?,
  totalClaimed: json['totalClaimed'] as String?,
  activeInvestments: (json['activeInvestments'] as num?)?.toInt(),
  completedInvestments: (json['completedInvestments'] as num?)?.toInt(),
  avgRoi: (json['avgRoi'] as num?)?.toInt(),
  lastCalculatedAt: json['lastCalculatedAt'] == null
      ? null
      : DateTime.parse(json['lastCalculatedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deleted: json['deleted'] as bool?,
  investments: (json['investments'] as List<dynamic>?)
      ?.map((e) => PortofolioItemResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PortofolioSummaryResponseToJson(
  PortofolioSummaryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'totalInvested': instance.totalInvested,
  'totalProfit': instance.totalProfit,
  'totalClaimed': instance.totalClaimed,
  'activeInvestments': instance.activeInvestments,
  'completedInvestments': instance.completedInvestments,
  'avgRoi': instance.avgRoi,
  'lastCalculatedAt': instance.lastCalculatedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deleted': instance.deleted,
  'investments': instance.investments,
};
