import 'package:flutter/material.dart';
import 'package:marketingApp/model/accountbrief.dart';
import 'package:marketingApp/model/transaction.dart';
import 'package:marketingApp/res/database.dart';
import 'package:marketingApp/res/projectNames.dart';

class NewTransactionPage extends StatefulWidget {
  final Transsaction transaction;

  const NewTransactionPage({Key key, this.transaction}) : super(key: key);
  @override
  _NewTransactionPageState createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
 
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _emailController;
  FocusNode _emailNode;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: isEditMote ? widget.transaction.projectName : '');
    _emailController = TextEditingController(
        text: isEditMote ? widget.transaction.projectEmail: '');
    _emailNode = FocusNode();
  }

  get isEditMote => widget.transaction != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMote ? 'Edit Project Name' : 'Add Project Name'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_emailNode);
                },
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Name cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _emailNode,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Email cannot be empty";
                  return null;
                },
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditMote ? "Update" : "Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMote) {
                        Transsaction transaction = Transsaction(
                          projectEmail: _emailController.text.trim(),
                          projectName: _nameController.text.trim(),
                          id: widget.transaction.id,
                        );
                        await DataProjectService().updateTransaction(transaction);
                      } else {
                        Transsaction transaction = Transsaction(
                          projectEmail: _emailController.text.trim(),
                          projectName: _nameController.text.trim(),
                          id: widget.transaction.id,
                        );
                        await DataProjectService().addTransaction(transaction);
                      }
                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
