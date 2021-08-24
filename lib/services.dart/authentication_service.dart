import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  // auth service constructor
  AuthenticationService(this._firebaseAuth);

  // stream getter for user's auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signIn({String? email, String? password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return "Sign in successful";
    } on FirebaseAuthException catch (e) {
      return (e.message!);
    }
  }

  Future<String> signUp({String? email, String? password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);

      return "Sign up successful";
    } on FirebaseAuthException catch (e) {
      return (e.message!);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
