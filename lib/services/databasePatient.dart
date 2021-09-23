import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_ui/models/user.dart';

class DatabaseServicePatient {
  final String uid;

  DatabaseServicePatient({this.uid});
// collection reference
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection("user");

  Future updateUserData(
      String name, String bloodGroup, String problem, String age) async {
    return await userInfo.doc(uid).set({
      'isPatient': true,
      'name': name,
      'problem': problem,
      'bloodGroup': bloodGroup,
      'age': age,
      'uid': uid
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot.data()['name']);
    print('calling from _userDatafom');
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      bloodgroup: snapshot.data()['bloodgroup'],
      problem: snapshot.data()['problem'],
      age: snapshot.data()['age'],
      isPatient: snapshot.data()['isPatient'],
    );
  }

  //get user doc stream
  Stream<UserData> get userdata {
    print(userInfo.doc(uid).snapshots());
    return userInfo.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
