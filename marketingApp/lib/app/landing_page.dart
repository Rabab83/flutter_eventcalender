// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as u;

import 'package:flutter/material.dart';
import 'package:marketingApp/app/home_page.dart';
import 'package:marketingApp/app/sign_in/sign_in_page.dart';
import 'package:marketingApp/services/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;
  // var role;
  @override
  Widget build(BuildContext context) {
    // print(role);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage(
                auth: auth,
              );
            }
            
            return HomePage(
              auth: auth,
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
