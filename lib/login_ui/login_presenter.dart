import 'package:serviceapp/data/repository/local_repository/local_repository.dart';
import 'package:serviceapp/data/repository/remote/remote_repository.dart';
import 'package:serviceapp/model/jsonPostLogin.dart';

import 'package:serviceapp/data/repository/remote/remote_repository.dart';
import 'package:serviceapp/model/jsonPostLogin.dart';

class LoginPresenter {
  LoginView _view;
  RemoteRepository remoteRepository;

  LoginPresenter(this._view, this.remoteRepository);

  onLoginClicked(String username, String password) async {
    try {
      JsonPostLogin jsonPostLogin = JsonPostLogin(username, password);
      await remoteRepository.postLogin(jsonPostLogin);
      _view.loginCorrect(true);
    } on Exception catch (e) {
      _view.loginError();
    }
  }
}

abstract class LoginView {
  loginCorrect(bool repuesta) {}

  loginError() {}
}