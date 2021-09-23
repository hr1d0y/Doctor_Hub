import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Doctorinfo extends StatefulWidget {
  final List<dynamic> a;
  Doctorinfo(this.a);

  @override
  _HospitalListClassState createState() => _HospitalListClassState();
}

class _HospitalListClassState extends State<Doctorinfo> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Department List"),
          centerTitle: true,
        ),
        body: new ListView.builder(
            itemCount: widget.a.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    //print(doc[index].documentID);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => Department(doc[index].id)),
                    // );
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Text(widget.a[index].toString()),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
