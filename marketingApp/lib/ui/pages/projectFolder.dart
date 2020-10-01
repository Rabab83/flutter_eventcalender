import 'package:flutter/material.dart';
import 'package:marketingApp/ui/pages/description.dart';

class ProjectFolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Project Folder'),),
      body: Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DescriptionFolder()),
                      ),
                      child: Text('Add Description',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
    );
      
    
  }
}