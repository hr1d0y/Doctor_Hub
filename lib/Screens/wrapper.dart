import 'package:flutter/material.dart';
// import 'package:login_ui/Screens/Home/authenticate.dart';
// import 'package:login_ui/Screens/Home/home.dart';
import 'package:login_ui/Screens/login/loginform.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/models/user.dart';
// import 'Home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userid>(context);
    // print(user);

    // return Authenticate();
    if (user == null) {
      return Loginform();
    } else {
      return RegisterScreen();
    }
  }
}
