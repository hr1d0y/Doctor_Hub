import 'package:flutter/material.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/login/login_doctor.dart';
import 'package:login_ui/Screens/login/login_patient.dart';
import 'package:login_ui/Screens/register/doctor_reg.dart';
import 'package:login_ui/Screens/register/patien_reg.dart';
import 'package:login_ui/Screens/register/register.dart';
//import 'package:login_ui/components/background.dart';

class Loginform extends StatelessWidget {
  final Function toggleView;
  Loginform({this.toggleView});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        elevation: 0.0,
        title: Text('Welcome'),
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
                  'Login As',
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DoctorLogin()));
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
                        "Doctor",
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => PatientLogin()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: size.width * 0.3,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: Color(0xFFEC407A),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Patient",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()))
                  },
                  child: Text(
                    "Registration",
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
