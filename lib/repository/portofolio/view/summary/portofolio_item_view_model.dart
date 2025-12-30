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
  });

  factory PortofolioItemViewModel.fromJson(Map<String, dynamic> json) =>
      _$PortofolioItemViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioItemViewModelToJson(this);
}
