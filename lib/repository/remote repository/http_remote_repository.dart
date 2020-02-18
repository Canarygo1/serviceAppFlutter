
import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/repository/remote%20repository/remote_repository.dart';

class HttpRemoteRepository implements RemoteRepositoryInterface {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<String> logInUser(String email, String password) async {
    LoggingUser(email, password);

    if (email == 'root' && password == '1234') {
      return logInUser(email, password);
    } else
      return null;
  }

  @override
  Future<bool> registerUser(NewUser newUser) async {
  var request = await _clien
    return true;
  }
}
