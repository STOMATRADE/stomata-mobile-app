import 'package:stomata_app/repository/portofolio/view/summary/portofolio_item_view_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portofolio_summary_view_model.g.dart';

@JsonSerializable()
class PortofolioSummaryViewModel {
  String? id;
  String? userId;
  String? totalInvested;
  String? totalProfit;
  String? totalClaimed;
  int? activeInvestments;
  int? completedInvestments;
  int? avgRoi;
  DateTime? lastCalculatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? deleted;
  List<PortofolioItemViewModel>? investments;

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
