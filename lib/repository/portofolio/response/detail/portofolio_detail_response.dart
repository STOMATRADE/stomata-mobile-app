import 'package:json_annotation/json_annotation.dart';

part 'portofolio_detail_response.g.dart';

@JsonSerializable()
class PortofolioDetailResponse {
  final String? projectId;
  final int? volume;
  final String? commodity;
  final DateTime? submissionDate;
  final DateTime? deliveryDate;
  final String? projectPrice;
  final String? fundingPrice;
  final String? currentFundingPrice;
  final int? returnInvestmentRate;
  final String? projectName;
  final String? collectorName;
  final String? farmerName;
  final int? investors;
  final String? status;
  final double? fundingPercentage;
  final String? image;
  final String? landAddress;
  final String? gradeQuality;
  final String? assets;
  final int? returnRate;
  final String? welcomeReturn;
  final String? cumulativeAsset;

  PortofolioDetailResponse({
    this.projectId,
    this.volume,
    this.commodity,
    this.submissionDate,
    this.deliveryDate,
    this.projectPrice,
    this.fundingPrice,
    this.currentFundingPrice,
    this.returnInvestmentRate,
    this.projectName,
    this.collectorName,
    this.farmerName,
    this.investors,
    this.status,
    this.fundingPercentage,
    this.image,
    this.landAddress,
    this.gradeQuality,
    this.assets,
    this.returnRate,
    this.welcomeReturn,
    this.cumulativeAsset,
  });

  factory PortofolioDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PortofolioDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioDetailResponseToJson(this);
}
