// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
//to import firebase
import 'package:firebase_core/firebase_core.dart';

import 'View/Login/authPage.dart';
import 'View/Login/loginpage.dart';
import 'View/Shop/shopPage.dart';

//connect the project to firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/*runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MyApp(),
    ),
  );
}*/

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //home: MainAuthPage(),
      //home: ProfileScreen(),
      home: AuthPage(),
    );
  }
}
