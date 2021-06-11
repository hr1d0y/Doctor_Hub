import 'package:flutter/material.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/register/register.dart';

class Authenticate extends StatefulWidget {
  // final Function toggleView;
  // RegisterScreen({this.toggleView});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLoginScreen = true;
  void toggleView() {
    setState(() => showLoginScreen = !showLoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(toggleView: toggleView);
    } else {
      return RegisterScreen(toggleView: toggleView);
    }
  }
}
