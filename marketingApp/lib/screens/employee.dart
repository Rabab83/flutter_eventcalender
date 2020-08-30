import 'package:flutter/material.dart';
import '../widgets/raisedButton.dart';
import 'calender.dart';

class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Button(
              text: Text('Employee'),
              navigateTo: Calender(),
              color: Colors.pinkAccent,
              textColor: Colors.black,
            ),
          ]),
    );
  }
}
