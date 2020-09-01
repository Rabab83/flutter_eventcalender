import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketingApp/screens/auth_screen.dart';
import 'package:marketingApp/screens/calender.dart';
import 'package:marketingApp/ui/pages/clientpage.dart';
import 'package:marketingApp/widgets/raisedButton.dart';
class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Button(
            text: Text('Employee'),
            navigateTo: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, userSnapshot) {
                if (userSnapshot.hasData) {
                  return Calender();
                }
                return AuthScreen();
              },
            ),
            color: Colors.pinkAccent,
            textColor: Colors.black,
          ),
          Button(
            text: Text('Client'),
            navigateTo: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, userSnapshot) {
                if (userSnapshot.hasData) {
                  return ClientPage();
                }
                return AuthScreen();
              },
            ),
            color: Colors.pinkAccent,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
