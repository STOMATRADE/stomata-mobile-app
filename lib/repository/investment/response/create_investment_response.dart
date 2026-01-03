import 'package:stomata_app/repository/investment/response/investment_project_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_investment_response.g.dart';

@JsonSerializable()
class CreateInvestmentResponse {
  final String? id;
  final String? amount;
  final int? receiptTokenId;
  final String? message;
  final DateTime? investedAt;
  final InvestmentProjectResponse? project;

  CreateInvestmentResponse({
    this.id,
    this.amount,
    this.receiptTokenId,
    this.message,
    this.investedAt,
    this.project,
  });

  factory CreateInvestmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInvestmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvestmentResponseToJson(this);
}
