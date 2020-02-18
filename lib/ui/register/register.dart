import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: register(),
    );
  }
}

Widget register() {
  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  textFieldForm('Nombre', Icon(Icons.account_circle)),
                  textFieldForm('Apellido', Icon(Icons.perm_identity)),
                  textFieldForm('Correo', Icon(Icons.email)),
                  textFieldForm('Direccion', Icon(Icons.person_pin_circle)),
                  textFieldForm('Movil', Icon(Icons.call)),
                  textFieldForm('Password', Icon(Icons.lock)),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Registrarme', style: TextStyle(fontSize: 20)),
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

Widget textFieldForm(String fieldName, Icon icon) {
  var regFields;
  regFields = Container(
    margin: const EdgeInsets.only(top: 30),
    height: 55,
    width: 250,
    child: TextFormField(
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
