import 'package:stomata_app/repository/project/response/project_item_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'project_list_response.g.dart';

@JsonSerializable()
class ProjectListResponse {
  final List<ProjectItemResponse>? items;
  final int? total;
  final int? page;
  final int? limit;
  final int? totalPages;

  ProjectListResponse({
    this.items,
    this.total,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory ProjectListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectListResponseToJson(this);
}
