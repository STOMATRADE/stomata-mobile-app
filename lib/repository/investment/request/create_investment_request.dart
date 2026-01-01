import 'package:json_annotation/json_annotation.dart';

part 'create_investment_request.g.dart';

@JsonSerializable()
class CreateInvestmentRequest {
  String? userId;
  String? projectId;
  String? amount;

  CreateInvestmentRequest({this.userId, this.projectId, this.amount});

  factory CreateInvestmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvestmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvestmentRequestToJson(this);
}
