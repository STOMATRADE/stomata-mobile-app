import 'package:json_annotation/json_annotation.dart';

part 'domain_response.g.dart';

@JsonSerializable()
class DomainResponse {
  final bool? status;

  DomainResponse({this.status});

  factory DomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DomainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DomainResponseToJson(this);
}
