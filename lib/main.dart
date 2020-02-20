import 'package:flutter/material.dart';
import 'package:serviceapp/login_ui/login_screen.dart';
import 'package:serviceapp/ui/detailScreen.dart';
import 'package:serviceapp/ui/list_activity/list_activity.dart';

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
      home: ListScreen(),
    );
  }
}