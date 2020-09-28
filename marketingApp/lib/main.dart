import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketingApp/services/auth.dart';
import 'package:marketingApp/ui/pages/add_event.dart';
import 'app/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Marketing App',
        home: LandingPage(
          auth: Auth(),),
          routes: {
             "add_event": (_) => AddEventPage(),
             },
             );
  }
}
