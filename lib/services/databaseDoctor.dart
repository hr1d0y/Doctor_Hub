import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceDoctor {
  final String uid;

  var userdata;
  DatabaseServiceDoctor({this.uid});
// collection reference
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection("doctor");

  Future updateUserData(
      String hospitalName, String department, String uid) async {
    return await userInfo.doc(uid).set({
      'isDoctor': 'true',
      'hospitalName': hospitalName,
      'department': department,
      'uid_doctor': uid,
    });
  }

  // get userinfo stream
  Stream<QuerySnapshot> get userInformation {
    return userInfo.snapshots();
  }
}
