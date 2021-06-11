import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_ui/models/user.dart';
import 'package:login_ui/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //cretae user object based on firebase user

  Userid _userFromUser(User user) {
    return user != null ? Userid(uid: user.uid) : null;
  }

// change user stream
  Stream<Userid> get user {
    return _auth.onAuthStateChanged
        //.map((User user) => _userFromUser(user));
        .map(_userFromUser);
  }

// sign in ano
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // created a new document for the user with uid from database
      await DatabaseService(uid: user.uid)
          .updateUserData('New Patient', 'Your Blood Group', 100);
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
