import 'package:serviceapp/data/repository/local_repository/local_repository.dart';
import 'package:serviceapp/data/repository/remote/remote_repository.dart';
import 'package:serviceapp/model/jsonPostLogin.dart';

class LoginPresenter {
  LoginView _view;
  RemoteRepository remoteRepository;
  final PreferencesLocalRepository _localRepository  = new PreferencesLocalRepository();

  LoginPresenter(this._view, this.remoteRepository);

  onLoginClicked(String username, String password) async {
    try {
      JsonPostLogin jsonPostLogin = JsonPostLogin(username, password);
      String token = await remoteRepository.postLogin(jsonPostLogin);
      print('Espero');
      _localRepository.saveToken(token);
      _view.loginCorrect(true);
    } on Exception catch (e) {
      _view.loginError();
    }
  }

  checkLocal() async {
    String token = await _localRepository.getToken();
    return token;
  }
}

abstract class LoginView {
  loginCorrect(bool response) {}
  loginError() {}
}
