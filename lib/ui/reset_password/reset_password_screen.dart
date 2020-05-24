import 'dart:async';
import 'package:flutter/material.dart';
import 'package:serviceapp/global_methods.dart';
import 'package:serviceapp/newdata/remote/check_connection.dart';
import 'package:serviceapp/ui/components/button.dart';
import 'package:serviceapp/ui/components/textTypes/large_text.dart';
import 'package:serviceapp/ui/components/textTypes/my_textField.dart';
import 'package:serviceapp/ui/components/textTypes/text_error.dart';
import 'package:serviceapp/ui/components/upElements/goback.dart';
import 'package:serviceapp/ui/login_ui/login_screen.dart';
import 'package:serviceapp/ui/reset_password/reset_password_presenter.dart';

class ResetPassword extends StatefulWidget {

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailControler = TextEditingController();
  double HEIGHT;
  double WIDHT;
  String error = "";

  @override
  Widget build(BuildContext context) {
    HEIGHT = MediaQuery
        .of(context)
        .size
        .height;
    WIDHT = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromRGBO(300, 300, 300, 1),
        child: ListView(
          children: <Widget>[
            GoBack(context, "Volver"),
            MyTextField(
              emailControler, TextInputType.emailAddress, InputDecoration(
              hintText: 'Correo Electronico',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white, width: WIDHT * 0.003),
              ),
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ), TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),),
            MyButton(() => sendEmail(context), LargeText("Enviar"),
                color: Color.fromRGBO(230, 73, 90, 1)),
            error.length == 0 ? Container() : TextError(error),
          ],
        ),
      ),
    );
  }

  sendEmail(BuildContext context) {
    ConnectionChecked.checkInternetConnectivity(context);
    ResetPasswordPresenter(emailControler.text.toString()).changePassword();
    setState(() {
      error = 'Se ha enviado un correo a dicho email';
    });
    Timer(Duration(seconds: 2), () =>
        GlobalMethods().pushAndReplacement(context, Login()));
  }
}
