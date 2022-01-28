import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? userName;
  String? phoneNumber;
  String? userType;

  UserModel({
    this.uid,
    this.userName,
    this.phoneNumber,
    this.userType,
  });

  UserModel.fromMap(Map<String, dynamic> map)
      : userType = map['userType'],
        uid = map['uid'],
        userName = map['userName'],
        phoneNumber = map['phoneNumber'];

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : userType = snapshot['userType'],
        uid = snapshot['uid'],
        userName = snapshot['userName'],
        phoneNumber = snapshot['phoneNumber'];
}