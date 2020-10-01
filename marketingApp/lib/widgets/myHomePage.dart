import 'package:flutter/material.dart';
import 'package:marketingApp/model/transaction.dart';
import 'package:marketingApp/res/projectNames.dart';
import 'package:marketingApp/widgets/new_transaction.dart';
import 'package:marketingApp/widgets/transactionDetails.dart';

//Displays names of account Breifs
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Projects'),
      ),
      body: FutureBuilder(
        future: DataProjectService().getTransactions(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Transsaction>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Transsaction transaction = snapshot.data[index];
              return ListTile(
                title: Text(transaction.projectName == null
                    ? "name is null"
                    : transaction.projectName),
                subtitle: Text(transaction.projectEmail == null
                    ? "email is null"
                    : transaction.projectEmail),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.edit),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                NewTransactionPage(transaction: transaction),
                          )),
                    ),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          _deleteTransaction(context, transaction.id),
                    ),
                  ],
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewTransactionDetailsPage(
                      transsaction: transaction,
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
              MaterialPageRoute(builder: (_) => NewTransactionPage()));
        },
      ),
    );
  }

  void _deleteTransaction(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await DataProjectService().deleteTransaction(id);
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
