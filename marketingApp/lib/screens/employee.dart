import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketingApp/widgets/myHomePage.dart';
import '../widgets/raisedButton.dart';
import 'calender.dart';

class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text('Employee Page'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              }),
          IconButton(
            icon: Icon(Icons.person_add), onPressed: null)    
        ],
      ),
          body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Button(
                text: Text('Employee'),
                navigateTo: MyHomePage(),
                color: Colors.pinkAccent,
                textColor: Colors.black,
              ),
            ]),
      ),
    );
  }
}
