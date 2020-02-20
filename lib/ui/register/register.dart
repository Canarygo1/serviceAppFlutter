import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serviceapp/repository/Injector.dart';
import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/ui/list_activity/list_activity.dart';
import 'package:serviceapp/ui/register/presenter_register.dart';

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
                    textFieldForm('Fecha Nacimiento (yy-mm-dd)', Icon(Icons.calendar_today),
                        controllerBirthDate),
                    textFieldForm('Movil', Icon(Icons.call), controllerMobile),
                    textFieldForm(
                        'Password', Icon(Icons.lock), controllerPassword),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        onPressed: () {

                          NewUser user = NewUser(
                              controllerName.text,
                              controllerUsername.text,
                              controllerEmail.text,
                              controllerBirthDate.text,
                              controllerMobile.text,
                              controllerPassword.text);
                          print('Me han pinchado ' + user.name);
                          _presenter.onRegisterClicked(user);
                        },
                        child:
                            Text('Registrarme', style: TextStyle(fontSize: 20)),
                      ),
                    ),
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
      margin: const EdgeInsets.only(top: 30),
      height: 55,
      width: 250,
      child: TextFormField(
        controller: controllerName,
        decoration: new InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(9, 174, 224, 1),
                width: 2.0,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(9, 174, 224, 1),
              width: 3.0,
            ),
          ),
          prefixIcon: icon,
          labelText: fieldName,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        style: new TextStyle(
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
