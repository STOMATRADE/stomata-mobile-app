import 'package:firebase_auth/firebase_auth.dart';

// NEED ENHANCE
class AuthLoginResponse {
  UserCredential? userData;
  bool? isError;
  String? errorMessage;

  AuthLoginResponse({this.errorMessage, this.isError, this.userData});
}
