import 'package:flutter/material.dart';
import 'package:marketingApp/screens/calender.dart';
import 'package:marketingApp/ui/pages/clientpage.dart';
import 'package:marketingApp/widgets/auth/auth_form.dart';
import 'widgets/raisedButton.dart';
import 'screens/clients.dart';
import 'package:marketingApp/ui/pages/add_event.dart';
import 'screens/employee.dart';
import './screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Marketing App'),
      routes: {
        "add_event": (_) => AddEventPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return Calender();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
