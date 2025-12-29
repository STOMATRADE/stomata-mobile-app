import 'package:stomata_app/repository/portofolio/response/summary/portofolio_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portofolio_summary_response.g.dart';

@JsonSerializable()
class PortofolioSummaryResponse {
  final String? id;
  final String? userId;
  final String? totalInvested;
  final String? totalProfit;
  final String? totalClaimed;
  final int? activeInvestments;
  final int? completedInvestments;
  final int? avgRoi;
  final DateTime? lastCalculatedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? deleted;
  final List<PortofolioItemResponse>? investments;

  PortofolioSummaryResponse({
    this.id,
    this.userId,
    this.totalInvested,
    this.totalProfit,
    this.totalClaimed,
    this.activeInvestments,
    this.completedInvestments,
    this.avgRoi,
    this.lastCalculatedAt,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.investments,
  });

  factory PortofolioSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PortofolioSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioSummaryResponseToJson(this);
}
