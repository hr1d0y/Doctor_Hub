// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/Home/Homescreen.dart';
import 'package:login_ui/Screens/Home/news_slider.dart';
import 'package:login_ui/Screens/animation/AnimatedBottomBar.dart';
import 'package:login_ui/services/database.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:login_ui/Screens/Home/Detailspage.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().userInformation,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Welcome to Doctor Hub'),
            backgroundColor: Color(0xFFE53935),
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(
                  Icons.power_settings_new_sharp,
                  color: Colors.white,
                ),
                label: Text(
                  'Signout',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(),
                onPressed: () async {
                  // await _auth.signOut();
                  // {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (BuildContext context) => Home()));
                  // }
                },
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  children: [SliderPage(), HomeScreen()],
                  // AnimatedBottomBar()
                ),
              ))
            ],
          )),
    );
  }
}
