// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailResponse _$ProjectDetailResponseFromJson(
  Map<String, dynamic> json,
) => ProjectDetailResponse(
  volume: (json['volume'] as num?)?.toInt(),
  commodity: json['commodity'] as String?,
  submissionDate: json['submissionDate'] == null
      ? null
      : DateTime.parse(json['submissionDate'] as String),
  deliveryDate: json['deliveryDate'] == null
      ? null
      : DateTime.parse(json['deliveryDate'] as String),
  projectPrice: json['projectPrice'] as String?,
  fundingPrice: json['fundingPrice'] as String?,
  currentFundingPrice: json['currentFundingPrice'] as String?,
  returnInvestmentRate: (json['returnInvestmentRate'] as num?)?.toInt(),
  projectId: json['projectId'] as String?,
  projectName: json['projectName'] as String?,
  collectorName: json['collectorName'] as String?,
  farmerName: json['farmerName'] as String?,
  investors: (json['investors'] as num?)?.toInt(),
  status: json['status'] as String?,
  fundingPercentage: (json['fundingPercentage'] as num?)?.toInt(),
  image: json['image'] as String?,
  landAddress: json['landAddress'] as String?,
  gradeQuality: json['gradeQuality'] as String?,
);

Map<String, dynamic> _$ProjectDetailResponseToJson(
  ProjectDetailResponse instance,
) => <String, dynamic>{
  'volume': instance.volume,
  'commodity': instance.commodity,
  'submissionDate': instance.submissionDate?.toIso8601String(),
  'deliveryDate': instance.deliveryDate?.toIso8601String(),
  'projectPrice': instance.projectPrice,
  'fundingPrice': instance.fundingPrice,
  'currentFundingPrice': instance.currentFundingPrice,
  'returnInvestmentRate': instance.returnInvestmentRate,
  'projectId': instance.projectId,
  'projectName': instance.projectName,
  'collectorName': instance.collectorName,
  'farmerName': instance.farmerName,
  'investors': instance.investors,
  'status': instance.status,
  'fundingPercentage': instance.fundingPercentage,
  'image': instance.image,
  'landAddress': instance.landAddress,
  'gradeQuality': instance.gradeQuality,
};
