import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serviceapp/data/model/user.dart';
import 'package:serviceapp/ui/list_activity/list_activity.dart';
import 'package:serviceapp/ui/register/presenter_register.dart';

import '../../data/Injector.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> implements RegisterView {
  RegisterPresenter _presenter;
  final controllerName = TextEditingController();
  final controllerUsername = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerBirthDate = TextEditingController();
  final controllerMobile = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _presenter = RegisterPresenter(this, Injector.instance.remoteRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: register(),
    );
  }

  Widget register() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 45, 47, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    textFieldForm(
                        'Nombre', Icon(Icons.account_circle), controllerName),
                    textFieldForm('Apellido', Icon(Icons.perm_identity),
                        controllerUsername),
                    textFieldForm('Correo', Icon(Icons.email), controllerEmail),
                    textFieldForm('Fecha Nacimiento (yy-mm-dd)',
                        Icon(Icons.calendar_today), controllerBirthDate),
                    textFieldForm('Movil', Icon(Icons.call), controllerMobile),
                    textFieldForm(
                        'Password', Icon(Icons.lock), controllerPassword),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                      child: ButtonTheme(
                        minWidth: 2,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            NewUser user = NewUser(
                                controllerName.text,
                                controllerUsername.text,
                                controllerEmail.text,
                                controllerBirthDate.text,
                                controllerMobile.text,
                                controllerPassword.text);
                            _presenter.onRegisterClicked(user);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color.fromRGBO(9, 174, 224, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldForm(
      String fieldName, Icon icon, TextEditingController controllerName) {
    var regFields;
    regFields = Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 45,
      width: 250,
      decoration: new BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: controllerName,
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.all(2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(9, 174, 224, 1),
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(9, 174, 224, 1),
            ),
          ),
          alignLabelWithHint: true,
          prefixIcon: icon,
          labelText: fieldName,
          labelStyle: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ),
        style: new TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontFamily: "Poppins",
        ),
      ),
    );

    return regFields;
  }

  @override
  openMainScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListScreen()));
    return null;
  }
}
