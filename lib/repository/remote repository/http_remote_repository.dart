import 'package:http/http.dart';
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
    print("entro en funcion");
    var json = newUser.toMap();
    var request = await _client.post('http://10.0.2.2:3000/register', body: json);
    print('enviao');
    int statusCode = request.statusCode;
    print(statusCode);
    return true;
  }

  
}
