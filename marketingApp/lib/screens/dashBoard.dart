import 'package:flutter/material.dart';
import 'package:marketingApp/screens/employee.dart';
import 'package:marketingApp/ui/pages/adminPage.dart';
import 'package:marketingApp/ui/pages/clientpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashBoardPage extends StatelessWidget {
  FirebaseAuth fAuth = FirebaseAuth.instance;
  FirebaseFirestore fStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Adel Shakel'),
              accountEmail: Text('Admin@gammal.tech'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.pink),
            ),
            ListTile(
              title: Text('Admin page'),
              leading: Icon(Icons.home),
              onTap: () {
                final userId = fAuth.currentUser.uid;
                fStore.collection('users').doc(userId).get().then((snapshot) =>
                    snapshot.data()['role'] == "admin"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminPage()))
                        : Text("you are not allowed"));
              },
            ),
            ListTile(
              title: Text('Employee'),
              leading: Icon(Icons.work),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Employee()),
                );
              },
            ),
            ListTile(
              title: Text('Client'),
              leading: Icon(Icons.note),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientPage()),
                );
              },
            ),

            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Marketiong App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Image.network(
              'https://images-platform.99static.com/shG9KEG5KMMiWXOQoqcA_zTYH4E=/298x81:1203x986/500x500/top/smart/99designs-contests-attachments/100/100532/attachment_100532829.jpg',
              fit: BoxFit.fitWidth,
              width: 500),
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              'The best place to Market your Business.',
              style: TextStyle(fontSize: 22.0, color: Colors.teal),
            ),
          ),
        ]),
      ),
    );
  }
}
