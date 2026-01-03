import 'package:json_annotation/json_annotation.dart';

part 'investment_project_view_model.g.dart';

@JsonSerializable()
class InvestmentProjectViewModel {
  String? id;
  String? commodity;
  String? farmerName;
  String? targetAmount;

  InvestmentProjectViewModel({
    this.id,
    this.commodity,
    this.farmerName,
    this.targetAmount,
  });

  factory InvestmentProjectViewModel.fromJson(Map<String, dynamic> json) =>
      _$InvestmentProjectViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentProjectViewModelToJson(this);
}
