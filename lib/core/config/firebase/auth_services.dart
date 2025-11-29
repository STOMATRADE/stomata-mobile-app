import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stomata_app/core/utils/logging.dart';

// NEED ENHANCE
class AuthService {
  static AuthService? _instance;

  AuthService._internal() {
    _instance = this;
  }

  factory AuthService() => _instance ?? AuthService._internal();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;

      final signIn = GoogleSignIn.instance;

      signIn.authenticationEvents.listen(
        (event) => print("Google Event: $event"),
        onError: (e) => print("Google Error: $e"),
      );

      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.idToken,
      //   idToken: googleAuth?.idToken,
      // );

      // return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      printLog('Auth Error : $e');
      rethrow;
    } on FirebaseException catch (e) {
      printLog("Firebase Error : $e");
      rethrow;
    } catch (e) {
      printLog("System Error : $e");
      rethrow;
    }
  }

  Future signOut() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      printLog('Logout Error : $e');
      rethrow;
    } catch (e) {
      printLog("System Error : $e");
      rethrow;
    }
  }
}
