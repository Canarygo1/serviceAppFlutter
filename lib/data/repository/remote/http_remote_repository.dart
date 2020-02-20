import 'package:http/http.dart';
import 'package:serviceapp/data/repository/remote/remote_repository.dart';
import 'package:serviceapp/model/Response.dart';
import 'package:serviceapp/model/jsonPostLogin.dart';

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<ApiLoginResponse> postLogin(JsonPostLogin jsonPostLogin) async {
    print("hola de nuevoo");
    var response = await _client.post("http://10.0.2.2:3000/auth",
        body: jsonPostLogin.toMap());
    print(response.body);
    if (response.statusCode == 200) {
    } else {
      throw Exception;
    }
  }
}
