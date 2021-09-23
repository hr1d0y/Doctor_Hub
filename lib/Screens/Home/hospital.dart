import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Screens/Home/departmentlist.dart';

class HospitalList extends StatefulWidget {
  // final doc;
  HospitalList();

  @override
  _HospitalListClassState createState() => _HospitalListClassState();
}

class _HospitalListClassState extends State<HospitalList> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SubCategories"),
        centerTitle: true,
      ),
      body: new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('hospital').snapshots(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            var doc = snapshot.data.docs;
            return new ListView.builder(
                itemCount: doc.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        print(doc.toString());
                        print(doc[index]["name"].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Department(doc[index]["department"])),
                        );
                        print(doc[index]["department"]);
                      },
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Text(doc[index]["name"].toString()),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
