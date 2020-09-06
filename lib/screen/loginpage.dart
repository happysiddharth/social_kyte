import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Container(
        child: Column(
          children: <Widget>[
            Text('h'),
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
