import 'package:serviceapp/data/model/jsonPostLogin.dart';
import 'package:serviceapp/data/repository/remote/remote_repository.dart';

class LoginPresenter {
  LoginView _view;
  RemoteRepository remoteRepository;

  LoginPresenter(this._view, this.remoteRepository);

  onLoginClicked(String username, String password) async {
    try {
      JsonPostLogin jsonPostLogin = JsonPostLogin(username, password);
      String passResponse = await remoteRepository.postLogin(jsonPostLogin);
      print(passResponse);
      if (passResponse != 'error') {
        print(password);
        _view.loginCorrect(true);
      }
    } on Exception catch (e) {
      _view.loginError();
    }
  }
}

abstract class LoginView {
  loginCorrect(bool repuesta) {}

  loginError() {}
}
