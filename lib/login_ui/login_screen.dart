import 'package:flutter/material.dart';
import 'package:serviceapp/login_ui/login_presenter.dart';

import '../Injector.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> implements LoginView {
  @override
  final loginController = TextEditingController();

  final passwordController = TextEditingController();

  LoginPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(this, Injector.instance.remoteRepository);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 45, 47, 1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(70.0, 120.0, 70.0, 0.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            textFieldForm(
                "Email",
                Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                loginController),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: textFieldForm(
                  "Password",
                  Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  passwordController),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
              child: Center(
                child: Text(
                  "Registrate",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            Center(
              child: Divider(
                thickness: 2.0,
                indent: 64,
                endIndent: 65,
                color: Color.fromRGBO(9, 174, 224, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
              child: ButtonTheme(
                minWidth: 2,
                height: 40,
                child: RaisedButton(
                  onPressed: () => {
                    presenter.onLoginClicked(
                        loginController.text, passwordController.text)
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0)),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromRGBO(9, 174, 224, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  loginCorrect(bool repuesta) {
    return null;
  }

  @override
  loginError() {
    return null;
  }
}

Widget textFieldForm(
    String fieldName, Icon icon, TextEditingController myController) {
  var regFields;
  regFields = Container(
    height: 45,
    width: 250,
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
    child: TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: myController,
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
