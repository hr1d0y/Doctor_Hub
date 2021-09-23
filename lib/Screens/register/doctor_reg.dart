import 'package:flutter/material.dart';
import 'package:login_ui/Screens/doctors_home/doctorshome.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:login_ui/services/auth.dart';
import 'package:login_ui/Screens/Home/home.dart';
// import 'package:login_ui/components/background.dart';
import 'package:login_ui/Screens/shared/loading.dart';

class DoctorRegistration extends StatefulWidget {
  final Function toggleView;
  DoctorRegistration({this.toggleView});

  @override
  _DoctorRegistration createState() => _DoctorRegistration();
}

class _DoctorRegistration extends State<DoctorRegistration> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field status
  String email = '';
  String password = '';

  String error = '';

  String hospitalName = '';
  String departmentName = '';

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFE53935),
              elevation: 0.0,
              title: Text('Doctors Registration'),
              actions: <Widget>[],
            ),
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //   alignment: Alignment.center,
                    //   padding: EdgeInsets.symmetric(horizontal: 40),
                    //   child: Text(
                    //     "Doctor Registration",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         color: Color(0xFFE53935),
                    //         fontSize: 26),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    SizedBox(height: 80),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 55),
                      child: Text(
                        'Register as',
                        style: TextStyle(
                            color: Color(0xFFE53935),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegisterScreen()));
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
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  fillColor: Colors.red[50],
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.pink, width: 2.0))),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  fillColor: Colors.red[50],
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.pink, width: 2.0))),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Hospital Name',
                                  fillColor: Colors.red[50],
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.pink, width: 2.0))),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              obscureText: false,
                              onChanged: (val) {
                                setState(() => hospitalName = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Department Name',
                                  fillColor: Colors.red[50],
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.pink, width: 2.0))),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              obscureText: false,
                              onChanged: (val) {
                                setState(() => departmentName = val);
                              },
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            print(email);
                            dynamic result =
                                await _auth.doctorRegisterWithEmailAndPassword(
                              email,
                              password,
                              hospitalName,
                              departmentName,
                            );
                            print(result);
                            print('result');

                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'Please supply a valid email';
                              });
                              SizedBox(height: 12.0);
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              );
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DoctorsHome()));
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          width: size.width * 0.5,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              color: Color(0xFFE53935)),
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()))
                        },
                        child: Text(
                          "Already Have an Account? login",
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
