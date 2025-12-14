// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_header_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseHeaderModel _$BaseHeaderModelFromJson(Map<String, dynamic> json) =>
    BaseHeaderModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$BaseHeaderModelToJson(BaseHeaderModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
    };
