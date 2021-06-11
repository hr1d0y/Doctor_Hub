import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/Home/home.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/register/doctor_reg.dart';
import 'package:login_ui/Screens/register/patien_reg.dart';
import 'package:login_ui/Screens/shared/loading.dart';

import 'doctorinfo.dart';

class DepartmentList extends StatefulWidget {
  @override
  _DepartmentListState createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  final db = FirebaseFirestore.instance;

  @override
  // Widget build(BuildContext context) {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        elevation: 0.0,
        title: Text('Doctor Hub'),
        actions: <Widget>[],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 80),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 55),
                child: Text(
                  'Hospital List',
                  style: TextStyle(
                      color: Color(0xFFE53935),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DoctorRegistration()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      width: size.width * 0.3,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: Color(0xFFE53935)),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Labaid",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 05, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PatientRegister()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: size.width * 0.3,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            color: Color(0xFFE53935)),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Square",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DoctorRegistration()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      width: size.width * 0.3,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: Color(0xFFE53935)),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Evercare",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 05, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PatientRegister()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: size.width * 0.3,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            color: Color(0xFFE53935)),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "United",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DoctorRegistration()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      width: size.width * 0.3,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: Color(0xFFE53935)),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Popular",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 05, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PatientRegister()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: size.width * 0.3,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            color: Color(0xFFE53935)),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Shamorita",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DoctorRegistration()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      width: size.width * 0.3,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: Color(0xFFE53935)),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Kurmitola",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 05, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PatientRegister()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: size.width * 0.3,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            color: Color(0xFFE53935)),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Anowar Khan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()))
                  },
                  child: Text(
                    "Home page",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFD32F2F)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
