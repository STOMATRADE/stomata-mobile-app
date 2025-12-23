import 'package:stomata_app/repository/project/view/project_item_view_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'project_list_view_model.g.dart';

@JsonSerializable()
class ProjectListViewModel {
  List<ProjectItemViewModel>? items;
  int? total;
  int? page;
  int? limit;
  int? totalPages;

  ProjectListViewModel({
    this.items,
    this.total,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory ProjectListViewModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectListViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectListViewModelToJson(this);
}
