import 'dart:convert';

import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/repository/remote%20repository/http_remote_repository.dart';

 class RegisterPresenter {
  final HttpRemoteRepository _remoteRepository;
  final RegisterView _view;

  RegisterPresenter(this._view, this._remoteRepository);

  onRegisterClicked(NewUser newUser) async {
    try {


      bool isCreated = await _remoteRepository.registerUser(newUser);
      print(isCreated);
      if (isCreated != true) {
        _view.openMainScreen();
      }else{
        _view.showLoginError();
      }
    } catch (e) {
      print(e);
    }
  }
}

abstract class RegisterView {
  openMainScreen();
  showLoginError();
}