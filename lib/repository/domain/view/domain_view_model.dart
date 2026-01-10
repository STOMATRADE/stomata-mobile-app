import 'package:json_annotation/json_annotation.dart';

part 'domain_view_model.g.dart';

@JsonSerializable()
class DomainViewModel {
  bool? status;

  DomainViewModel({this.status});

  factory DomainViewModel.fromJson(Map<String, dynamic> json) =>
      _$DomainViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$DomainViewModelToJson(this);
}
