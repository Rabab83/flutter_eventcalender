import 'package:flutter/material.dart';
import 'package:marketingApp/model/accountbrief.dart';
import 'package:marketingApp/res/firestore_service.dart';

class AddAccountBreifPage extends StatefulWidget {
  final AccountBreif accountBreif;

  const AddAccountBreifPage({Key key, this.accountBreif}) : super(key: key);
  @override
  AddAccountBreifPageState createState() => AddAccountBreifPageState();
}

class AddAccountBreifPageState extends State<AddAccountBreifPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _industryController;
  FocusNode _industyrNode;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: isEditMote ? widget.accountBreif.name : '');
    _industryController = TextEditingController(
        text: isEditMote ? widget.accountBreif.industry : '');
    _industyrNode = FocusNode();
    _marketLocationController = TextEditingController(
        text: isEditMote ? widget.accountBreif.marketLocation : '');
    _cAnalysisController = TextEditingController(
        text: isEditMote ? widget.accountBreif.cAnalysis : '');
    _companyController = TextEditingController(
        text: isEditMote ? widget.accountBreif.company : '');
    _companySellController = TextEditingController(
        text: isEditMote ? widget.accountBreif.companySell : '');
    _varyFromCompetitorsController = TextEditingController(
        text: isEditMote ? widget.accountBreif.varyFromCompetitors : '');
    _competitiveAdvantageController = TextEditingController(
        text: isEditMote ? widget.accountBreif.competitiveAdvantage : '');
    _uniqueBrandController = TextEditingController(
        text: isEditMote ? widget.accountBreif.uniqueBrand : '');
    _businessBetterController = TextEditingController(
        text: isEditMote ? widget.accountBreif.businessBetter : '');
  }

  get isEditMote => widget.accountBreif != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMote ? 'Edit account breif' : 'Add account'),
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
                  FocusScope.of(context).requestFocus(_industyrNode);
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
                focusNode: _industyrNode,
                controller: _industryController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "industry",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _marketLocationController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "market Location",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _cAnalysisController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "3c Analysis",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _companyController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "company",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _companySellController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText:
                      "What does my company sell? ist your major product lines or types",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _varyFromCompetitorsController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText:
                      "Do our products vary from competitors' products? If so, in what ways?",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _competitiveAdvantageController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "What competitive advantage does my company have?",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _uniqueBrandController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "industry",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _businessBetterController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "industry",
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
                        AccountBreif accountBreif = AccountBreif(
                          industry: _industryController.text,
                          name: _nameController.text,
                          id: widget.accountBreif.id,
                        );
                        await FirestoreService()
                            .updateAccountBreif(accountBreif);
                      } else {
                        AccountBreif accountBreif = AccountBreif(
                          industry: _industryController.text,
                          name: _nameController.text,
                        );
                        await FirestoreService().addAccountBreif(accountBreif);
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
