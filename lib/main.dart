import 'package:ecume/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Helvetica",
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.blueAccent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 28.0, color: Colors.blueAccent),
          headline2: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Colors.blueAccent,
          ),
          bodyText1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.redAccent),
        ),
      ),
      home: LoginView(),
    );
  }
}
