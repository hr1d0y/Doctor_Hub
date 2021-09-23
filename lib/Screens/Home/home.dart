// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/Home/Homescreen.dart';
import 'package:login_ui/Screens/Home/news_slider.dart';
// import 'package:login_ui/Screens/animation/AnimatedBottomBar.dart';
// import 'package:login_ui/Screens/settings/settings_form.dart';
// import 'package:login_ui/Screens/animation/AnimatedBottomBar.dart';
import 'package:login_ui/services/databaseDoctor.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:login_ui/Screens/Home/Detailspage.dart';
import 'package:login_ui/Screens/Home/user_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseServiceDoctor().userInformation,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
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
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // UserList(),
                  Container(
                    child: Column(
                      children: [SliderPage(), HomeScreen()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
