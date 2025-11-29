import 'package:privy_flutter/privy_flutter.dart';

class VerifyPrivyModel {
  bool? success;
  String? message;
  PrivyUser? privyUser;

  VerifyPrivyModel({this.message, this.success, this.privyUser});
}
