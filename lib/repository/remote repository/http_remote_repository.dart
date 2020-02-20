import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart';
import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/repository/model/work.dart';
import 'package:serviceapp/repository/remote%20repository/remote_repository.dart';

class HttpRemoteRepository implements RemoteRepositoryInterface {
  final Client _client;
  List<Work> listOfWorks = [];

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
    var request =
        await _client.post('http://10.0.2.2:3000/register', body: json);
    print('enviao');
    int statusCode = request.statusCode;
    print(statusCode);
    return true;
  }

  @override
  Future<List<Work>> showList() async {
    var response = await _client.get('http://10.0.2.2:3000/servicios');
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);

      List workList = jsonBody['result'].body;

      for (int i = 0; i < workList.length; i++) {
        String type = workList[i]['type'];
        String date = workList[i]['date'];
        String moreInfo = workList[i]['moreInfo'];
        double reward = workList[i]['reward'];

        Work addWork = new Work(type, date, moreInfo, reward);
        listOfWorks.add(addWork);
      }
      print(listOfWorks);

      return listOfWorks;
    } else {
      return null;
    }
  }
}
