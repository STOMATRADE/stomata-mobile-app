import 'package:json_annotation/json_annotation.dart';

part 'sof_response.g.dart';

@JsonSerializable()
class SofResponse {
  final String? amount;
  final String? userId;
  final String? walletAddress;

  SofResponse({
    required this.amount,
    required this.userId,
    required this.walletAddress,
  });

  factory SofResponse.fromJson(Map<String, dynamic> json) =>
      _$SofResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SofResponseToJson(this);
}
