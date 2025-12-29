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
  });

  factory PortofolioItemResponse.fromJson(Map<String, dynamic> json) =>
      _$PortofolioItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioItemResponseToJson(this);
}
