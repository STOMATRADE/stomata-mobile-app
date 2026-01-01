import 'package:json_annotation/json_annotation.dart';

part 'investment_request.g.dart';

@JsonSerializable()
class InvestmentRequest {
  String? userId;
  String? projectId;
  String? amount;

  InvestmentRequest({this.userId, this.projectId, this.amount});

  factory InvestmentRequest.fromJson(Map<String, dynamic> json) =>
      _$InvestmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentRequestToJson(this);
}
