import 'package:flutter/material.dart';
import 'package:marketingApp/screens/calender.dart';
import 'package:marketingApp/ui/pages/addingNotesPage.dart';
import 'package:marketingApp/ui/pages/adminuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketingApp/ui/pages/clientUser.dart';

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
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              })
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClientUser()),
                      ),
                      child: Text('Add Note', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Calender()),
                      ),
                      child: Text('Add Action plan',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
