import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String password;
  final int phone;
  final String imageUrl;


  UserModel(
      {required this.uid,
        required this.firstName,
        required this.phone,
        required this.password,
        required this.imageUrl
       });

  Map<String, dynamic> toMap() {
    return {

      'uid': uid,
      'firstName': firstName,
        'phone':phone,
      'password': password,
      "imageUrl":imageUrl
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        firstName: map['firstName'],
        phone: map['phone'],
        imageUrl: map['imageUrl'],
        password: map['password'],
      );
  }
}
