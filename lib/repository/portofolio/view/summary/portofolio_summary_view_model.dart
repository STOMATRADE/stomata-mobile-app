import 'package:stomata_app/repository/portofolio/view/summary/portofolio_item_view_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portofolio_summary_view_model.g.dart';

@JsonSerializable()
class PortofolioSummaryViewModel {
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
  final List<PortofolioItemViewModel>? investments;

  PortofolioSummaryViewModel({
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

  factory PortofolioSummaryViewModel.fromJson(Map<String, dynamic> json) =>
      _$PortofolioSummaryViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioSummaryViewModelToJson(this);
}
