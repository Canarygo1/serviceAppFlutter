import 'package:serviceapp/repository/remote%20repository/http_remote_repository.dart';

import 'list_activity.dart';

class ActivitiesPresenter {
  final HttpRemoteRepository _remoteRepository;
  final ListScreen _view;

  ActivitiesPresenter(this._view, this._remoteRepository);

  showActivitiesBy() async {

  }
}

abstract class RegisterView {
  openMainScreen();
  showLoginError();
}