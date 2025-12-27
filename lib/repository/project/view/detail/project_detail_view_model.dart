import 'package:json_annotation/json_annotation.dart';

part 'project_detail_view_model.g.dart';

@JsonSerializable()
class ProjectDetailViewModel {
  String? id;
  int? tokenId;
  String? collectorId;
  String? farmerId;
  String? landId;
  String? commodity;
  String? name;
  int? volume;
  int? volumeDecimal;
  int? profitShare;
  DateTime? sendDate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? deleted;

  ProjectDetailViewModel({
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

  factory ProjectDetailViewModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailViewModelToJson(this);
}
