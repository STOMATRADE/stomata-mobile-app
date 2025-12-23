import 'package:json_annotation/json_annotation.dart';

part 'portofolio_amount_response.g.dart';

@JsonSerializable()
class PortofolioAmountResponse {
  final String? amount;
  final String? returnAmount;
  final int? percentage;
  final String? userId;
  final String? totalInvested;
  final String? totalProfit;

  PortofolioAmountResponse({
    required this.amount,
    required this.returnAmount,
    required this.percentage,
    required this.userId,
    required this.totalInvested,
    required this.totalProfit,
  });

  factory PortofolioAmountResponse.fromJson(Map<String, dynamic> json) =>
      _$PortofolioAmountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortofolioAmountResponseToJson(this);
}
