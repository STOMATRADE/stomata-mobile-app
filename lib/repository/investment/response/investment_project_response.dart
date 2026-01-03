import 'package:json_annotation/json_annotation.dart';

part 'investment_project_response.g.dart';

@JsonSerializable()
class InvestmentProjectResponse {
  final String? id;
  final String? commodity;
  final String? farmerName;
  final String? targetAmount;

  InvestmentProjectResponse({
    this.id,
    this.commodity,
    this.farmerName,
    this.targetAmount,
  });

  factory InvestmentProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$InvestmentProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentProjectResponseToJson(this);
}
