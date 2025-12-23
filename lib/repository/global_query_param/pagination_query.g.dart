// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationQuery _$PaginationQueryFromJson(Map<String, dynamic> json) =>
    PaginationQuery(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationQueryToJson(PaginationQuery instance) =>
    <String, dynamic>{'page': instance.page, 'limit': instance.limit};
