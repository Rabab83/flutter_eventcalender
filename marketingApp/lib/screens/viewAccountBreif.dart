import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketingApp/model/classes.dart';
import 'package:marketingApp/screens/addAccountBreif.dart';
import 'package:marketingApp/services/crudFunctions.dart';

// Widget To view Account Breif
//also, navigation to a form Brand File
//and navigation to view Account breif details by tapping the account breif name

class ViewAccountBreif extends StatelessWidget {
  final AccountBreif accountBreif;
  final String aBid;
  ViewAccountBreif({this.aBid, this.accountBreif});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Mammdouh'),
              accountEmail: Text('Mammdouh@gmail.com'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddAccountBreifPage(
                            aBid: aBid,
                            accountBreif: accountBreif,
                          )),
                );
              },
            ),
            ListTile(
              title: Text('Upload Brand Identity'),
              leading: Icon(Icons.work),
              onTap: () {},
            ),
            ListTile(
              title: Text('Upload Brand Logo'),
              leading: Icon(Icons.local_activity),
              onTap: () {},
            ),

            ListTile(
              title: Text('Marketing Plan'),
              leading: Icon(Icons.notifications),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Brand Description'),
      ),
      body: FutureBuilder(
        future: NewAccountBreifDB().getOneAccountBreif(aBid),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError)
            return Center(child: CircularProgressIndicator());
          //***************/
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              AccountBreif accountBreif = snapshot.data();
              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(accountBreif.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            color: Colors.deepPurple,
                            icon: Icon(Icons.edit),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddAccountBreifPage(
                                    aBid: aBid, accountBreif: accountBreif),
                              ),
                            ),
                          ),
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                _deleteAccountBreif(context, accountBreif.aBid),
                          ),
                        ],
                      ),
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => AccountBreifDetails(accountBreif.id),
                      //   ),
                    ),
                  ),
                ),
              );
            },
          );
          // return  ListTile(
          //     title: Text(snapshot.data().name==null?'':snapshot.data().name),
          //     trailing: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: <Widget>[
          //         IconButton(
          //           color: Colors.deepPurple,
          //           icon: Icon(Icons.edit),
          //           onPressed: () => Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (_) =>
          //                   AddAccountBreifPage(accountBreif: snapshot.data()),
          //             ),
          //           ),
          //         ),
          //         IconButton(
          //           color: Colors.red,
          //           icon: Icon(Icons.delete),
          //           onPressed: () =>
          //               _deleteAccountBreif(context, snapshot.data.id),
          //         ),
          //       ],
          //     ),
          //     onTap: () => Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (_) =>
          //             AddAccountBreifPage(accountBreif: snapshot.data),
          //       ),
          //     ),
          // );
        },
      ),
    );
  }

  void _deleteAccountBreif(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await NewAccountBreifDB().deleteAccountBreif(id);
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
