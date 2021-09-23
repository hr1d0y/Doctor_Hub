import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Screens/shared/loading.dart';
import 'package:login_ui/models/user.dart';
import 'package:login_ui/services/databaseBooking.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Booking extends StatefulWidget {
  // final doc1;
  // Booking(this.doc1);
  @override
  _BookingState createState() => _BookingState();
}

String _radioValue; //Initial definition of radio button value
String choice;

String _currentdate = 'Date: 10-09-21 Time: 6:00-7:00 PM';
String _currentpatientUid;
String _currentdoctorName = 'Sarwar Rahman';

class _BookingState extends State<Booking> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('could not launch $command');
    }
  }

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

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          setState(() {
            _currentdate = 'Date: 10-09-21 Time: 6:00-7:00 PM';
          });
          choice = value;
          break;
        case 'two':
          setState(() {
            _currentdate = 'Date: 10-09-21 Time: 7:00-8:00 PM';
          });
          choice = value;
          break;
        case 'three':
          setState(() {
            _currentdate = 'Date: 10-09-21 Time: 8:00-9:00 PM';
          });
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    final userinfo = Provider.of<Userid>(context);
    final docuid = userinfo.uid;

    String doctorName;
    String apoinTime;
    _fetch() async {
      // if (docuid != null)
      //   await FirebaseFirestore.instance
      //       .collection('brews')
      //       .doc(docuid)
      //       .collection('existingapoinment')
      //       .doc(widget.doc1)
      //       .get()
      //       .then((ds) {
      //     doctorName = ds.data()['doctor_name'];
      //     apoinTime = ds.data()['time'];
      //     print(doctorName);
      //   }).catchError((e) {
      //     print(e);
      //   });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctors Hub',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Name : $doctorName",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    'Dr. S.M. Hasan Shariar',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Evercare',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Text(
                                        'Neuro Surgeon Department',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Assitant Proffessor',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'BMDC reg -35447',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      'Consultant Fee = 500 BDT',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Schedule',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Apoinment time",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Date: 10-09-21 Time: 6:00-7:00 PM",
                            ),
                            Radio(
                              value: 'one',
                              groupValue: _radioValue,
                              onChanged: radioButtonChanges,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Date: 10-09-21 Time: 7:00-8:00 PM",
                            ),
                            Radio(
                              value: 'two',
                              groupValue: _radioValue,
                              onChanged: radioButtonChanges,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Date: 10-09-21 Time: 8:00-9:00 PM",
                            ),
                            Radio(
                              value: 'three',
                              groupValue: _radioValue,
                              onChanged: radioButtonChanges,
                            ),
                          ],
                        ),
                        SizedBox(height: 50.0),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () async {
                        await Databasebooking(
                                uid: FirebaseAuth.instance.currentUser.uid)
                            .updateBooking(
                          _currentdate ?? '',
                          FirebaseAuth.instance.currentUser.uid ?? '',
                          _currentdoctorName ?? '',
                        );
                        showAlertDialog(context);
                        // customLaunch('tel: +8801670831873');
                      },
                      child: Icon(Icons.save),
                      backgroundColor: Colors.red.shade500,
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Loading();
          }
        },
      ),
    );
  }
}
