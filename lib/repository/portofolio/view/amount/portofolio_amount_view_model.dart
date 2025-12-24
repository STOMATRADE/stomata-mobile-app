import 'package:json_annotation/json_annotation.dart';

part 'portofolio_amount_view_model.g.dart';

@JsonSerializable()
class PortofolioAmountViewModel {
  String? amount;
  String? returnAmount;
  int? percentage;
  String? userId;
  String? totalInvested;
  String? totalProfit;

  PortofolioAmountViewModel({
    this.amount,
    this.returnAmount,
    this.percentage,
    this.userId,
    this.totalInvested,
    this.totalProfit,
  });

  factory PortofolioAmountViewModel.fromJson(Map<String, dynamic> json) =>
      _$PortofolioAmountViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioAmountViewModelToJson(this);
}
