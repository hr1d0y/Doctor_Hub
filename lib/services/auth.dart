import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_ui/models/user.dart';
import 'package:login_ui/services/databaseDoctor.dart';
import 'package:login_ui/services/databasePatient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //cretae user object based on firebase user

  Userid _userFromUser(User user) {
    return user != null ? Userid(uid: user.uid) : null;
  }

// change user stream
  Stream<Userid> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromUser(user));
        .map(_userFromUser);
  }

// login ano
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

// login as patient with email and password
// doctor
  Future doctorLogin(String email, String password) async {
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

  Future<String> _getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = (prefs.getString('uid') ?? "no data available");
    print('$uid');
    return uid;
  }

  _setUid(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("uid", uid);
    print("Sucess");
  }

// patient
  Future patientLogin(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      _setUid(user.uid);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

// signup with email and password
// doctor

  Future doctorRegisterWithEmailAndPassword(String email, String password,
      String hospitalName, String departmentName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // created a new document for the user with uid from database
      await DatabaseServiceDoctor(uid: user.uid)
          .updateUserData(hospitalName, departmentName, user.uid);
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

// patient
  Future patientRegisterWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // created a new document for the user with uid from database
      await DatabaseServicePatient(uid: user.uid)
          .updateUserData('New Patient', 'Your Blood Group', 'problem', '100');
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
