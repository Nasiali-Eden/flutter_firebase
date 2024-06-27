import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebaseUser
  F_User? _userFromFirebaseUser(User? user) {
    return user != null ? F_User(uid: user.uid) : null;
  }

  // create user obj based on Firebase User
  Stream<F_User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anonymously
  Future signAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email and password
  // register with email and password
  // sign out
}
