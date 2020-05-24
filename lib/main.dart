import 'package:flutter/material.dart';
import 'package:serviceapp/ui/login_ui/login_screen.dart';
import 'package:serviceapp/ui/map/map_screen.dart';
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
      home: Login(),

    );
  }
}
