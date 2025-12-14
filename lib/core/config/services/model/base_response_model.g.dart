// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    BaseResponseModel(
      header: BaseHeaderModel.fromJson(json['header'] as Map<String, dynamic>),
      data: json['data'],
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{'header': instance.header, 'data': instance.data};
