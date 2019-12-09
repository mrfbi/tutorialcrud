import 'package:flutter/material.dart';
import 'package:tutorialcrud/MyHomePage.dart';
import 'package:tutorialcrud/PageLogin.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageLogin(),
      routes: <String,WidgetBuilder>{
        "/PageHome":(BuildContext context) => new MyHomePage(),
        "/PageLogin":(BuildContext context) => new PageLogin(),
      },
    );
  }
}

