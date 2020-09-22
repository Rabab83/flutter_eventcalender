import 'package:flutter/cupertino.dart';

class Users {
  String uid;
  String role;
  Users({
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
