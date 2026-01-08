import 'package:json_annotation/json_annotation.dart';

part 'portofolio_detail_view_model.g.dart';

@JsonSerializable()
class PortofolioDetailViewModel {
  String? projectId;
  int? volume;
  String? commodity;
  DateTime? submissionDate;
  DateTime? deliveryDate;
  String? projectPrice;
  String? fundingPrice;
  String? currentFundingPrice;
  int? returnInvestmentRate;
  String? projectName;
  String? collectorName;
  String? farmerName;
  int? investors;
  String? status;
  double? fundingPercentage;
  String? image;
  String? landAddress;
  String? gradeQuality;
  String? assets;
  String? returnAsset;
  int? returnRate;
  String? cumulativeAsset;

  PortofolioDetailViewModel({
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
    this.cumulativeAsset,
  });

  factory PortofolioDetailViewModel.fromJson(Map<String, dynamic> json) =>
      _$PortofolioDetailViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioDetailViewModelToJson(this);
}
