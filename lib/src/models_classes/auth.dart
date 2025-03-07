import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Done";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "weak-password";
      } else if (e.code == 'email-already-in-use') {
        return "email-used";
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "Email or password are wrong";
      } else if (e.code == 'wrong-password') {
        return "Email or password are wrong";
      }
    }
  }

  checkUser() {
    if (_auth.currentUser != null) {
      return "/home";
    } else {
      return "/";
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  getUserId() async {
    return await _auth.currentUser?.uid;
  }
}
