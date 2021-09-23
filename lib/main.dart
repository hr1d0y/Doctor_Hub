import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/Home/home.dart';
import 'package:login_ui/Screens/animation/AnimatedBottomBar.dart';

import 'package:login_ui/Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_ui/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userid>.value(
      value: AuthService().user,
      // initialData: Userid(uid: ''),
      catchError: (_, __) => null,

      child: MaterialApp(
        title: 'Doctor Hub',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: Color(0xFF2661FA),
        //   scaffoldBackgroundColor: Colors.bllack,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        home: Wrapper(),
      ),
    );
  }
}
