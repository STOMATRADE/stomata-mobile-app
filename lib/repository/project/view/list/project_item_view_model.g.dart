// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_item_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectItemViewModel _$ProjectItemViewModelFromJson(
  Map<String, dynamic> json,
) => ProjectItemViewModel(
  projectId: json['projectId'] as String?,
  projectName: json['projectName'] as String?,
  projectCompany: json['projectCompany'] as String?,
  totalFunding: json['totalFunding'] as String?,
  fundingPrice: json['fundingPrice'] as String?,
  investors: (json['investors'] as num?)?.toInt(),
  margin: (json['margin'] as num?)?.toInt(),
  image: json['image'] as String?,
  status: json['status'] as String?,
  fundingPercentage: (json['fundingPercentage'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProjectItemViewModelToJson(
  ProjectItemViewModel instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'projectName': instance.projectName,
  'projectCompany': instance.projectCompany,
  'totalFunding': instance.totalFunding,
  'fundingPrice': instance.fundingPrice,
  'investors': instance.investors,
  'margin': instance.margin,
  'image': instance.image,
  'status': instance.status,
  'fundingPercentage': instance.fundingPercentage,
};
