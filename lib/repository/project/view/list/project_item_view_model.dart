import 'package:json_annotation/json_annotation.dart';

part 'project_item_view_model.g.dart';

@JsonSerializable()
class ProjectItemViewModel {
  String? projectId;
  String? projectName;
  String? projectCompany;
  String? totalFunding;
  String? fundingPrice;
  int? investors;
  int? margin;
  String? image;
  String? status;
  int? fundingPercentage;

  ProjectItemViewModel({
    this.projectId,
    this.projectName,
    this.projectCompany,
    this.totalFunding,
    this.fundingPrice,
    this.investors,
    this.margin,
    this.image,
    this.status,
    this.fundingPercentage,
  });

  factory ProjectItemViewModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectItemViewModelToJson(this);
}
