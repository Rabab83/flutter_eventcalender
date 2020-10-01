import 'package:flutter/foundation.dart';

class Transsaction {
  final String id;
  final String projectName;
  final String projectEmail;
  

  Transsaction({
    @required this.id,
    @required this.projectName,
    @required this.projectEmail,
    
  });

   Transsaction.fromMap(Map<String, dynamic> data, String id)
      : projectName = data["projectName"],
        projectEmail = data['projectEmail'],
        id = id;

  Transsaction.fromOneMap( dynamic data, String id)
        : projectName = data["projectName"],
          projectEmail = data['projectEmail'],
          id = id;

  Map<String, dynamic> toMap() {
    return {
      "projectName": projectName,
      "projectEmail": projectEmail,
    };
  }
}
