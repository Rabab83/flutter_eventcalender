import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketingApp/model/accountbrief.dart';
import 'package:marketingApp/res/database.dart';
import 'package:marketingApp/ui/pages/accountBreif_details.dart';
import 'package:marketingApp/ui/pages/add_accountBreif.dart';

//Displays names of account Breifs
class ClientUser extends StatefulWidget {
  AccountBreif accountBreif;
  @override
  _ClientUserState createState() => _ClientUserState();
}

class _ClientUserState extends State<ClientUser> {
  AccountBreif accountBreif;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(accountBreif.email);
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Breif'),
      ),
      body: FutureBuilder(
        future: DataService().getOneAccountBreif(accountBreif.email),
        builder: (BuildContext context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasError || !snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              AccountBreif accountBreif = snapshot.data();
              return ListTile(
                title: Text(accountBreif.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.edit),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddAccountBreifPage(),
                          )),
                    ),
                    IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteAccountBreif(context, accountBreif.id);
                        }),
                  ],
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AccountBreifDetailsPage(
                      accountBreif: accountBreif,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => AddAccountBreifPage()));
        },
      ),
    );
  }

  void _deleteAccountBreif(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await DataService().deleteAccountBreif(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("Are you sure you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.red,
                  child: Text("Delete"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  textColor: Colors.black,
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
