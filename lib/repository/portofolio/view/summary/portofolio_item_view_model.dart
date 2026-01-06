import 'package:json_annotation/json_annotation.dart';

part 'portofolio_item_view_model.g.dart';

@JsonSerializable()
class PortofolioItemViewModel {
  String? id;
  String? projectId;
  String? projectName;
  String? farmerName;
  String? amount;
  int? receiptTokenId;
  DateTime? investedAt;
  String? profitClaimed;
  int? profitClaimsCount;
  String? fundingPrice;
  String? totalFunding;
  int? margin;
  String? returnAsset;
  String? cumulativeAsset;
  String? image;
  String? collectorName;

  PortofolioItemViewModel({
    this.id,
    this.projectId,
    this.projectName,
    this.farmerName,
    this.amount,
    this.receiptTokenId,
    this.investedAt,
    this.profitClaimed,
    this.profitClaimsCount,
    this.fundingPrice,
    this.totalFunding,
    this.margin,
    this.returnAsset,
    this.cumulativeAsset,
    this.image,
    this.collectorName,
  });

  factory PortofolioItemViewModel.fromJson(Map<String, dynamic> json) =>
      _$PortofolioItemViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioItemViewModelToJson(this);
}
