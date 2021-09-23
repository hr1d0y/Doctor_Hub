import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_ui/models/user.dart';

class Databasebooking {
  final String uid;

  Databasebooking({this.uid});
// collection reference
  final CollectionReference bookingInfo =
      FirebaseFirestore.instance.collection("booking");

  Future updateBooking(
      String date, String patientUid, String doctorName) async {
    return await bookingInfo.doc(uid).set({
      'date': date,
      'patientUid': patientUid,
      'doctorName': doctorName,
    });
  }

  Bookingdata _userDataFromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot.data()['name']);
    print('calling from _userDatafom');
    return Bookingdata(
      date: snapshot.data()['date'],
      patientUid: snapshot.data()['patientUid'],
      doctorName: snapshot.data()['doctorName'],
    );
  }

  //get user doc stream
  Stream<Bookingdata> get bookingData {
    print(bookingInfo.doc(uid).snapshots());
    return bookingInfo.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
