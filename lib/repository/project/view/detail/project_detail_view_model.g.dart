// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailViewModel _$ProjectDetailViewModelFromJson(
  Map<String, dynamic> json,
) => ProjectDetailViewModel(
  id: json['id'] as String?,
  tokenId: (json['tokenId'] as num?)?.toInt(),
  collectorId: json['collectorId'] as String?,
  farmerId: json['farmerId'] as String?,
  landId: json['landId'] as String?,
  commodity: json['commodity'] as String?,
  name: json['name'] as String?,
  volume: (json['volume'] as num?)?.toInt(),
  volumeDecimal: (json['volumeDecimal'] as num?)?.toInt(),
  profitShare: (json['profitShare'] as num?)?.toInt(),
  sendDate: json['sendDate'] == null
      ? null
      : DateTime.parse(json['sendDate'] as String),
  status: json['status'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deleted: json['deleted'] as bool?,
);

Map<String, dynamic> _$ProjectDetailViewModelToJson(
  ProjectDetailViewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'tokenId': instance.tokenId,
  'collectorId': instance.collectorId,
  'farmerId': instance.farmerId,
  'landId': instance.landId,
  'commodity': instance.commodity,
  'name': instance.name,
  'volume': instance.volume,
  'volumeDecimal': instance.volumeDecimal,
  'profitShare': instance.profitShare,
  'sendDate': instance.sendDate?.toIso8601String(),
  'status': instance.status,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deleted': instance.deleted,
};
