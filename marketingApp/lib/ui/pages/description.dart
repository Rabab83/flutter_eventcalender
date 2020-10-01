import 'package:flutter/material.dart';
import 'package:marketingApp/ui/pages/clientUser.dart';

class DescriptionFolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Mammdouh'),
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
              title: Text('Add Account Breif'),
              leading: Icon(Icons.work),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClientUser()));
              },
            ),
            ListTile(
              title: Text('Add brand Identity'),
              leading: Icon(Icons.work),
              onTap: () {},
            ),

            ListTile(
              title: Text('Add brand Logo'),
              leading: Icon(Icons.note),
              onTap: () {},
            ),

            ListTile(
              title: Text(' Current Marketing Plan'),
              leading: Icon(Icons.notifications),
              onTap: () {},
            ),
          ]),
        ),
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            'Description',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center());
  }
}
