import 'package:json_annotation/json_annotation.dart';

part 'user_view_model.g.dart';

@JsonSerializable()
class UserViewModel {
  String? id;
  String? walletAddress;
  String? role;

  UserViewModel({this.id, this.walletAddress, this.role});

  factory UserViewModel.fromJson(Map<String, dynamic> json) =>
      _$UserViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserViewModelToJson(this);
}
