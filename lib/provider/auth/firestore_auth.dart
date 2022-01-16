import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String userid;
  final String email;
  final String fistname;
  final String lastname;
  final String password;
  DatabaseService({
    required this.userid,
    required this.email,
    required this.fistname,
    required this.lastname,
    required this.password,
  });
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  Future updateUserData(email, userid, password) async {
    return await userCollection.doc(userid).set({
      'FistName': fistname,
      'LastName': lastname,
      'email': email,
      'userid': userid,
      'password': password,
    });
  }

  Future getUserData(id) async {
    return await userCollection.doc(id).get();
  }
}

class DatabaseServiceSocialAuth {
  final String userid;
  final String email;
  final String fistname;
  final String lastname;
  DatabaseServiceSocialAuth({
    required this.userid,
    required this.email,
    required this.fistname,
    required this.lastname,
  });
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  Future updateUserDataSocailAuth(email, userid) async {
    return await userCollection.doc(userid).set({
      'FistName': fistname,
      'LastName': lastname,
      'email': email,
      'userid': userid,
    });
  }

  Future getUserDataSocailAuth(id) async {
    return await userCollection.doc(id).get();
  }
}
