import 'package:firebase_helpers/firebase_helpers.dart';

class ActionBrief extends DatabaseItem {
  final String id;
  final String name;
  final String email;
  final String userId;
  ActionBrief({this.id, this.name, this.email, this.userId}) : super(id);

  factory ActionBrief.fromMap(Map data) {
    return ActionBrief(
      name: data['name'],
      email: data['email'],
    );
  }

  factory ActionBrief.fromDS(String id, Map<String, dynamic> data) {
    return ActionBrief(
      id: id,
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "id": id,
    };
  }
}
