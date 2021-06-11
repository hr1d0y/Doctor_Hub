import 'package:flutter/material.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:login_ui/services/auth.dart';
import 'package:login_ui/Screens/Home/home.dart';
//import 'package:login_ui/components/background.dart';
import 'package:login_ui/Screens/shared/loading.dart';

class PatientRegister extends StatefulWidget {
  final Function toggleView;
  PatientRegister({this.toggleView});

  @override
  _PatientRegister createState() => _PatientRegister();
}

class _PatientRegister extends State<PatientRegister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field status
  String email = '';
  String password = '';
  String error = '';

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFEC407A),
              elevation: 0.0,
              title: Text('Patient Registration'),
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
                        'Register as',
                        style: TextStyle(
                            color: Color(0xFFEC407A),
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
                                color: Color(0xFFEC407A)),
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "Patient",
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
                                  fillColor: Colors.pink[50],
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
                                  fillColor: Colors.pink[50],
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
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'Please supply a valid email');
                              loading = false;
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
                                      builder: (BuildContext context) =>
                                          Home()));
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          width: size.width * 0.5,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              color: Color(0xFFEC407A)),
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
                              color: Color(0XFFEC407A)),
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
