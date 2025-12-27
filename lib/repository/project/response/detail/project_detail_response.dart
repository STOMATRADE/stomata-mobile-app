import 'package:json_annotation/json_annotation.dart';

part 'project_detail_response.g.dart';

@JsonSerializable()
class ProjectDetailResponse {
  final int? volume;
  final String? commodity;
  final DateTime? submissionDate;
  final DateTime? deliveryDate;
  final String? projectPrice;
  final String? fundingPrice;
  final String? currentFundingPrice;
  final int? returnInvestmentRate;
  final String? projectId;
  final String? projectName;
  final String? collectorName;
  final String? farmerName;
  final int? investors;
  final String? status;
  final int? fundingPercentage;
  final String? image;
  final String? landAddress;
  final String? gradeQuality;

  ProjectDetailResponse({
    this.volume,
    this.commodity,
    this.submissionDate,
    this.deliveryDate,
    this.projectPrice,
    this.fundingPrice,
    this.currentFundingPrice,
    this.returnInvestmentRate,
    this.projectId,
    this.projectName,
    this.collectorName,
    this.farmerName,
    this.investors,
    this.status,
    this.fundingPercentage,
    this.image,
    this.landAddress,
    this.gradeQuality,
  });

  factory ProjectDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailResponseToJson(this);
}
