import 'package:json_annotation/json_annotation.dart';

part 'project_item_view_model.g.dart';

@JsonSerializable()
class ProjectItemViewModel {
  final String? projectId;
  final String? projectName;
  final String? projectCompany;
  final String? totalFunding;
  final String? fundingPrice;
  final int? investors;
  final int? margin;
  final String? image;
  final String? status;
  final int? fundingPercentage;

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
