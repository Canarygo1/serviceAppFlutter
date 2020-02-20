import 'package:flutter/material.dart';
import 'package:serviceapp/login_ui/login_presenter.dart';
import 'package:serviceapp/login_ui/login_screen.dart';
import 'package:serviceapp/ui/register/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginScreen(),
    );
  }
}