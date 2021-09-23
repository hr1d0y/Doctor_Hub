class Userid {
  final String uid;
  Userid({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String age;
  final String bloodgroup;
  final String problem;
  final bool isPatient;

  UserData(
      {this.uid,
      this.bloodgroup,
      this.problem,
      this.name,
      this.age,
      this.isPatient});
}

class DoctorData {
  final String uid;
  final String name;
  final String hospitalName;
  final String department;
  DoctorData({this.uid, this.name, this.hospitalName, this.department});
}

class Bookingdata {
  final String date;
  final String patientUid;
  final String doctorName;
  Bookingdata({this.date, this.patientUid, this.doctorName});
}
