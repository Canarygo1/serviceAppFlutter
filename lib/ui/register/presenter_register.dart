import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/repository/remote%20repository/remote_repository.dart';

/* class LoginPresenter {
  final LocalRepository _localRepository;
  final RemoteRepository _remoteRepository;
  final LoginView _view;

  LoginPresenter(this._view, this._remoteRepository, this._localRepository);

  onLoginClicked(String name, String pwd) async {
    try {
     /*loggingUser isLogged = await _remoteRepository.logInUser(name, pwd);
      if (isLogged!=null) {
        _localRepository.saveUser(isLogged);
        _view.openMainScreen();
      }*/
    } catch (e) {
      _view.showLoginError();
    }
  }
}

abstract class LoginView {
  openMainScreen();
  showLoginError();
} */