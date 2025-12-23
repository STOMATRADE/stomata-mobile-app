import 'package:json_annotation/json_annotation.dart';

part 'pagination_query.g.dart';

@JsonSerializable()
class PaginationQuery {
  int? page;
  int? limit;

  PaginationQuery({this.page, this.limit});

  factory PaginationQuery.fromJson(Map<String, dynamic> json) =>
      _$PaginationQueryFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationQueryToJson(this);
}
