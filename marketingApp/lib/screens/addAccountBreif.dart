import 'package:flutter/material.dart';
import 'package:marketingApp/model/classes.dart';
import 'package:marketingApp/services/crudFunctions.dart';

// Form to add Account Breif to new Brands
//viewAccountBreif navigate to this form

class AddAccountBreifPage extends StatefulWidget {
  final AccountBreif accountBreif;
  final String aBid;
  const AddAccountBreifPage({Key key, this.accountBreif,this.aBid}) : super(key: key);
  @override
  _AddAccountBreifPageState createState() => _AddAccountBreifPageState();
}

class _AddAccountBreifPageState extends State<AddAccountBreifPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _industryController;
  FocusNode _industryNode;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: isEditMote ? widget.accountBreif.name : '');
    _industryController = TextEditingController(
        text: isEditMote ? widget.accountBreif.industry : '');
    _industryNode = FocusNode();
    
  }

  get isEditMote => widget.accountBreif != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMote ? 'Edit Account Breif' : 'Add Account Breif'),
        // title: Text( 'Add Account Breif'),
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
                  FocusScope.of(context).requestFocus(_industryNode);
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
                focusNode: _industryNode,
                controller: _industryController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Industry cannot be empty";
                  return null;
                },
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: "Industry",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditMote ? "Update" : "Save"),
                // child: Text( "Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMote) {
                        AccountBreif acccountBreif = AccountBreif(
                          industry: _industryController.text.trim(),
                          name: _nameController.text.trim(),
                          aBid: widget.aBid,
                        );
                        await NewAccountBreifDB().updateAccountBreif(acccountBreif);
                      } else {
                        AccountBreif acccountBreif = AccountBreif(
                          industry: _industryController.text.trim(),
                          name: _nameController.text.trim(),
                          aBid: widget.aBid
                        );
                        await NewAccountBreifDB().updateAccountBreif(acccountBreif);
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
