import 'package:json_annotation/json_annotation.dart';

part 'sof_view_model.g.dart';

@JsonSerializable()
class SofViewModel {
  final String? amount;
  final String? userId;
  final String? walletAddress;

  SofViewModel({
    required this.amount,
    required this.userId,
    required this.walletAddress,
  });

  factory SofViewModel.fromJson(Map<String, dynamic> json) =>
      _$SofViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$SofViewModelToJson(this);
}
