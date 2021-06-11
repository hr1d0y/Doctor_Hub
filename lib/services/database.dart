import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
// collection reference
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection("user");

  Future updateUserData(String name, String bloodGroup, int age) async {
    return await userInfo.doc(uid).set({
      'name': name,
      'bloodGroup': bloodGroup,
      'age': age,
    });
  }

  // get userinfo stream
  Stream<QuerySnapshot> get userInformation {
    return userInfo.snapshots();
  }
}
