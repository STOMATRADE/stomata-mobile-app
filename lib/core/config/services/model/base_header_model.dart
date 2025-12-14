import 'package:json_annotation/json_annotation.dart';

part 'base_header_model.g.dart';

@JsonSerializable()
class BaseHeaderModel {
  final int statusCode;
  final String message;
  final DateTime timestamp;

  BaseHeaderModel({
    required this.statusCode,
    required this.message,
    required this.timestamp,
  });

  factory BaseHeaderModel.fromJson(Map<String, dynamic> json) =>
      _$BaseHeaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseHeaderModelToJson(this);
}
