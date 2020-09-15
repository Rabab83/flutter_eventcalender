import 'package:flutter/material.dart';
import 'package:marketingApp/model/accountbrief.dart';
import 'package:marketingApp/res/database.dart';

class AddAccountBreifPage extends StatefulWidget {
  final AccountBreif accountBreif;

  const AddAccountBreifPage({Key key, this.accountBreif}) : super(key: key);
  @override
  _AddAccountBreifPageState createState() => _AddAccountBreifPageState();
}

class _AddAccountBreifPageState extends State<AddAccountBreifPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _emailController;
  FocusNode _emailNode;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: isEditMote ? widget.accountBreif.name : '');
    _emailController = TextEditingController(
        text: isEditMote ? widget.accountBreif.email : '');
    _emailNode = FocusNode();
  }

  get isEditMote => widget.accountBreif != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMote ? 'Edit Account Breif' : 'Add Account Breif'),
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
                        AccountBreif acccountBreif = AccountBreif(
                          email: _emailController.text,
                          name: _nameController.text,
                          id: widget.accountBreif.id,
                        );
                        await DataService().updateAccountBreif(acccountBreif);
                      } else {
                        AccountBreif acccountBreif = AccountBreif(
                          email: _emailController.text,
                          name: _nameController.text,
                        );
                        await DataService().addAccountBreif(acccountBreif);
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
