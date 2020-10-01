import 'package:flutter/material.dart';
import 'package:marketingApp/model/note.dart';
import 'package:marketingApp/res/firestore_service.dart';
import 'package:marketingApp/screens/calender.dart';
import 'package:marketingApp/ui/pages/add_note.dart';
import 'package:marketingApp/ui/pages/addingNotesPage.dart';
import 'package:marketingApp/ui/pages/adminuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketingApp/ui/pages/clientUser.dart';
import 'package:marketingApp/ui/pages/projectFolder.dart';

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
                     onPressed: () {
                         Navigator.push(
                     context, MaterialPageRoute(builder: (_) => AddNotePage()));
                                 },
                      child: Text('Add New Project', style: TextStyle(fontSize: 15)),
                    ),
                  ),
     FutureBuilder(
        future: FirestoreService().getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Note note = snapshot.data[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.edit),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddNotePage(note: note),
                          )),
                    ),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteNote(context, note.id),
                    ),
                  ],
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProjectFolder(                  
                    ),
                  ),
                ),
              );
            },
          );
        },
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

void _deleteNote(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await FirestoreService().deleteNote(id);
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

