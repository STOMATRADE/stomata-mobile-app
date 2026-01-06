// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_item_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortofolioItemViewModel _$PortofolioItemViewModelFromJson(
  Map<String, dynamic> json,
) => PortofolioItemViewModel(
  id: json['id'] as String?,
  projectId: json['projectId'] as String?,
  projectName: json['projectName'] as String?,
  farmerName: json['farmerName'] as String?,
  amount: json['amount'] as String?,
  receiptTokenId: (json['receiptTokenId'] as num?)?.toInt(),
  investedAt: json['investedAt'] == null
      ? null
      : DateTime.parse(json['investedAt'] as String),
  profitClaimed: json['profitClaimed'] as String?,
  profitClaimsCount: (json['profitClaimsCount'] as num?)?.toInt(),
  fundingPrice: json['fundingPrice'] as String?,
  totalFunding: json['totalFunding'] as String?,
  margin: (json['margin'] as num?)?.toInt(),
  returnAsset: json['returnAsset'] as String?,
  cumulativeAsset: json['cumulativeAsset'] as String?,
  image: json['image'] as String?,
  collectorName: json['collectorName'] as String?,
);

Map<String, dynamic> _$PortofolioItemViewModelToJson(
  PortofolioItemViewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'projectName': instance.projectName,
  'farmerName': instance.farmerName,
  'amount': instance.amount,
  'receiptTokenId': instance.receiptTokenId,
  'investedAt': instance.investedAt?.toIso8601String(),
  'profitClaimed': instance.profitClaimed,
  'profitClaimsCount': instance.profitClaimsCount,
  'fundingPrice': instance.fundingPrice,
  'totalFunding': instance.totalFunding,
  'margin': instance.margin,
  'returnAsset': instance.returnAsset,
  'cumulativeAsset': instance.cumulativeAsset,
  'image': instance.image,
  'collectorName': instance.collectorName,
};
