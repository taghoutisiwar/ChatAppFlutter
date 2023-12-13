import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String firstName;
  String uid;
  String lastName;
  String pfp;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.pfp,
  });
  factory UserModel.fromJson(DocumentSnapshot json) {
    return UserModel(
      uid: json.id,
      firstName: json["firstName"],
      lastName: json["lastName"],
      pfp:
          "https://firebasestorage.googleapis.com/v0/b/chatflutter2-34aef.appspot.com/o/3177440.png?alt=media&token=2f1cc372-0524-45e9-9ed8-4b9e5e1bae75",
    );
  }
}
