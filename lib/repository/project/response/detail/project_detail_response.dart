import 'package:json_annotation/json_annotation.dart';

part 'project_detail_response.g.dart';

@JsonSerializable()
class ProjectDetailResponse {
  final String? id;
  final int? tokenId;
  final String? collectorId;
  final String? farmerId;
  final String? landId;
  final String? commodity;
  final String? name;
  final int? volume;
  final int? volumeDecimal;
  final int? profitShare;
  final DateTime? sendDate;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? deleted;

  ProjectDetailResponse({
    this.id,
    this.tokenId,
    this.collectorId,
    this.farmerId,
    this.landId,
    this.commodity,
    this.name,
    this.volume,
    this.volumeDecimal,
    this.profitShare,
    this.sendDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  factory ProjectDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailResponseToJson(this);
}
