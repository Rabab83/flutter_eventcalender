import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Page'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      //obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                      controller: name,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      //obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'BusniessName',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Describe Your Business',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Why your Busniess Unique?',
                      ),
                    ),
                  ),
                  
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text(
                            'Existing Brand Guidelines in place ?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Radio(
                            value: 1,
                            groupValue: 2,
                          ),
                          Text('Yes'),
                          Radio(
                            value: 2,
                            groupValue: 2,
                          ),
                          Text('No'),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Any Colors You Like/DisLike ?',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Scope of Project',
                      ),
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {},
                      child: Text('Add New Profile'),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  // Text('data'),
                ],
              ),
            ),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
