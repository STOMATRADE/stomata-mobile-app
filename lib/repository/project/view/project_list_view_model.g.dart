// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectListViewModel _$ProjectListViewModelFromJson(
  Map<String, dynamic> json,
) => ProjectListViewModel(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProjectItemViewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProjectListViewModelToJson(
  ProjectListViewModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
};
