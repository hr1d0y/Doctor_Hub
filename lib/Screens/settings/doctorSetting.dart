import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/Screens/shared/loading.dart';
import 'package:login_ui/Screens/shared/constants.dart';
import 'package:login_ui/services/databasePatient.dart';
import 'package:login_ui/models/user.dart';
import 'dart:ui';

class SettingsFormPatient extends StatefulWidget {
  @override
  _SettingsFormPatientState createState() => _SettingsFormPatientState();
}

class _SettingsFormPatientState extends State<SettingsFormPatient> {
  final _formKey = GlobalKey<FormState>();
  final List<String> bloodgroup = [
    'AB-negative',
    'B-negative',
    'AB-positive',
    'A-negative',
    'O-negative',
    'B-positive',
    'A-positive',
    'O-positive'
  ];
  String dropdownValue = 'AB-negative';
  // form values
  String _currentname;
  String _currentbloodgroup;
  String _currentproblem;
  String _currentage;

  showAlertDialog(BuildContext context) {
    // set up the buttons
    // Widget cancelButton = FlatButton(
    //   child: Text("Cancel"),
    //   onPressed: () {

    //   },
    // );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Congratulation"),
      content: Text("Information Saved!"),
      actions: [
        // cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userinfo = Provider.of<Userid>(context);
    print(userinfo.uid);
    print('first uid');
    print(DatabaseServicePatient(uid: userinfo.uid).userdata);

    return StreamBuilder<UserData>(
      stream: DatabaseServicePatient(uid: userinfo.uid).userdata,
      builder: (context, snapshot) {
        print(snapshot.data);
        print('first snap');
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          print(userData);
          return Scaffold(
            appBar: AppBar(
              title: Text('User'),
              backgroundColor: Color(0xFFE53935),
              elevation: 0.0,
              actions: <Widget>[],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          // Text(
                          //   'Update your brew settings.',
                          //   style: TextStyle(fontSize: 18.0),
                          // ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: userData.name,
                            decoration: textInputDecoration,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter a name' : null,
                            onChanged: (val) =>
                                setState(() => _currentname = val),
                          ),

                          SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: userData.age,
                            decoration: textInputDecoration,
                            validator: (val) =>
                                val.isEmpty ? 'Please your age' : null,
                            onChanged: (val) =>
                                setState(() => _currentage = val),
                          ),

                          SizedBox(height: 10.0),
                          TextFormField(
                            initialValue: userData.problem,
                            decoration: textInputDecoration,
                            validator: (val) => val.isEmpty
                                ? 'Please your previous cases'
                                : null,
                            onChanged: (val) =>
                                setState(() => _currentproblem = val),
                          ),
                          SizedBox(height: 10.0),
                          // RaisedButton(
                          //   color: Colors.pink[400],
                          //   child: Text(
                          //     'Update',
                          //     style: TextStyle(color: Colors.white),
                          //   ),
                          //   onPressed: () async {
                          //     if (_formKey.currentState.validate()) {
                          //       await DatabaseServicePatient(
                          //               uid: FirebaseAuth.instance.currentUser.uid)
                          //           .updateUserData(
                          //         _currentName ?? 'userData.name',
                          //         _currentbloodgroup ?? 'userData.bloodgroup',
                          //         _currentproblem ?? 'userData.problem',
                          //         // _currentbloodgroup ?? userData.bloodgroup,
                          //         // _currentuid ?? userData.uid,
                          //         // _currentproblem ?? userData.problem,
                          //       );
                          //       Navigator.pop(context);
                          //     } else {}
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: bloodgroup
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if ( true
                        //   // _formKey.currentState.validate()
                        //   ) {
                        await DatabaseServicePatient(
                                uid: FirebaseAuth.instance.currentUser.uid)
                            .updateUserData(
                          _currentname ?? userData.name,
                          _currentbloodgroup ?? dropdownValue,
                          _currentproblem ?? userData.problem,
                          _currentage ?? userData.age,
                        );
                        showAlertDialog(context);
                        // Navigator.pop(context);
                        // } else {
                        //   return Loading();
                        // }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}

class BlurryDialog extends StatelessWidget {
  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.content, this.continueCallBack);
  TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: new Text(
            title,
            style: textStyle,
          ),
          content: new Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Continue"),
              onPressed: () {
                continueCallBack();
              },
            ),
            new FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
