import 'package:stomata_app/repository/investment/view/investment_project_view_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_investment_view_model.g.dart';

@JsonSerializable()
class CreateInvestmentViewModel {
  String? id;
  String? amount;
  int? receiptTokenId;
  String? message;
  DateTime? investedAt;
  InvestmentProjectViewModel? project;

  CreateInvestmentViewModel({
    this.id,
    this.amount,
    this.receiptTokenId,
    this.message,
    this.investedAt,
    this.project,
  });

  factory CreateInvestmentViewModel.fromJson(Map<String, dynamic> json) =>
      _$CreateInvestmentViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvestmentViewModelToJson(this);
}
