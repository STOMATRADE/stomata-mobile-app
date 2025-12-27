import 'package:json_annotation/json_annotation.dart';

part 'project_detail_view_model.g.dart';

@JsonSerializable()
class ProjectDetailViewModel {
  int? volume;
  String? commodity;
  DateTime? submissionDate;
  DateTime? deliveryDate;
  String? projectPrice;
  String? fundingPrice;
  String? currentFundingPrice;
  int? returnInvestmentRate;
  String? projectId;
  String? projectName;
  String? collectorName;
  String? farmerName;
  int? investors;
  String? status;
  int? fundingPercentage;
  String? image;
  String? landAddress;
  String? gradeQuality;

  ProjectDetailViewModel({
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

  factory ProjectDetailViewModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailViewModelToJson(this);
}
