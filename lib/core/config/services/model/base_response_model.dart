import 'package:stomata_app/core/config/services/model/base_header_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel {
  BaseHeaderModel header;
  dynamic data;

  BaseResponseModel({required this.header, required this.data});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}
