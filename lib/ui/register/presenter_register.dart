import 'package:serviceapp/data/model/user.dart';
import 'package:serviceapp/data/repository/remote/http_remote_repository.dart';


 class RegisterPresenter {
  final HttpRemoteRepository _remoteRepository;
  final RegisterView _view;

  RegisterPresenter(this._view, this._remoteRepository);

  onRegisterClicked(NewUser newUser) async {
    try {
      bool isCreated = await _remoteRepository.registerUser(newUser);
      print(isCreated);
      if (isCreated == true) {
        _view.openMainScreen();
      }else{
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}

abstract class RegisterView {
  openMainScreen();
}