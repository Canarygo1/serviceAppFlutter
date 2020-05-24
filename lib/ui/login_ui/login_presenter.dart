import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:serviceapp/data/model/jsonPostLogin.dart';
import 'package:serviceapp/data/model/user.dart';
import 'package:serviceapp/global_methods.dart';
import 'package:serviceapp/newdata/local/db_sqlite.dart';
import 'package:serviceapp/newdata/remote/http_remote_repository.dart';
import 'package:serviceapp/newdata/remote/remote_repository.dart';

class LoginCode {
  LoginView loginView;
  LoginCode(this.loginView);

  final FirebaseAuth auth = FirebaseAuth.instance;
  User userLogin;
  Widget screen;
  //RemoteRepository _remoteRepository = HttpRemoteRepository(Firestore.instance);

  void iniciarSesion(
      String email, String password, BuildContext context) async {
    FirebaseUser user;
    try {
      user = (await auth.signInWithEmailAndPassword(
          email: email, password: password))
          .user;
      //userLogin = await _remoteRepository.getUser(user.uid);
      /*DBProvider.db.insert(userLogin);
      GlobalMethods().searchDBUser(context);
      loginView.changeTextError("");*/
    } catch (Exception) {
      loginView.changeTextError("Los datos no son correctos");
    }
  }
}

abstract class LoginView {
  changeTextError(String text);
}