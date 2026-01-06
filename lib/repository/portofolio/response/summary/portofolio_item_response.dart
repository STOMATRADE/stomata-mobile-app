import 'package:json_annotation/json_annotation.dart';

part 'portofolio_item_response.g.dart';

@JsonSerializable()
class PortofolioItemResponse {
  final String? id;
  final String? projectId;
  final String? projectName;
  final String? farmerName;
  final String? amount;
  final int? receiptTokenId;
  final DateTime? investedAt;
  final String? profitClaimed;
  final int? profitClaimsCount;
  final String? fundingPrice;
  final String? totalFunding;
  final int? margin;
  final String? returnAsset;
  final String? cumulativeAsset;
  final String? image;
  final String? collectorName;

  PortofolioItemResponse({
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

  factory PortofolioItemResponse.fromJson(Map<String, dynamic> json) =>
      _$PortofolioItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioItemResponseToJson(this);
}
