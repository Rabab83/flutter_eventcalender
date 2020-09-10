import 'package:flutter/cupertino.dart';

class User {
  String uid;
  String role;
  User({
    @required this.uid,
    @required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "role": role,
    };
  }
}
