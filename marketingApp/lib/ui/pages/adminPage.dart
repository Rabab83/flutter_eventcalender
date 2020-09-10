import 'package:flutter/material.dart';
import 'package:marketingApp/widgets/raisedButton.dart';

import 'adminuser.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.logout), onPressed: () {})
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
                child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminUser()),
                  ),
                  child: Text('Add Project', style: TextStyle(fontSize: 20)),
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
