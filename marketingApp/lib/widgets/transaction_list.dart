import 'package:flutter/material.dart';
import 'package:marketingApp/model/transaction.dart';
import 'package:marketingApp/ui/pages/clientUser.dart';

class TransactionList extends StatelessWidget {
  final List<Transsaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
          children: <Widget>[
            Text(
              'No Projects added yet!',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
            : ListView.builder(
              itemBuilder: (ctx, index) {
              return Card(
                 child: Row(
                  children: <Widget>[
                   Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                              child: Text(
                        transactions[index].projectName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClientUser()),
                      );
                      },
                    ),
                  ),
                  
                ],
              ),
            );
          },
          itemCount: transactions.length,
        ),
      ),
    );
  }
}
