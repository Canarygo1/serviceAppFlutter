import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:serviceapp/data/model/jsonPostLogin.dart';
import 'package:serviceapp/data/model/user.dart';
import 'package:serviceapp/data/model/work.dart';
import 'package:serviceapp/data/repository/remote/remote_repository.dart';


class HttpRemoteRepository implements RemoteRepository {
  final Client _client;
  List<Work> listOfWorks = [];
  List<Work> listOfBeauty = [];
  List<Work> listOfCarWash = [];
  List<Work> listOfChoresAtHome = [];

  HttpRemoteRepository(this._client);

  @override
  Future<String> postLogin(JsonPostLogin jsonPostLogin) async {
    print("hola de nuevoo");
    var response = await _client.post("http://10.0.2.2:3000/auth",
        body: jsonPostLogin.toMap());
    print(response.body);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      LinkedHashMap<String, dynamic> responseList = jsonBody;
      return responseList['token'];
    } else {
      throw Exception;
    }
  }

  @override
  Future<bool> registerUser(NewUser newUser) async {
    var json = newUser.toMap();
    var request =
        await _client.post('http://10.0.2.2:3000/register', body: json);
    int statusCode = request.statusCode;
    return true;
  }

  @override
  Future<List<Work>> showList() async {
    listOfWorks = [];
    listOfBeauty = [];
    listOfCarWash = [];
    listOfChoresAtHome = [];
    var response = await _client.get('http://10.0.2.2:3000/servicios/all');

    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);

      List workList = jsonBody;

      for (int i = 0; i < workList.length; i++) {
        addToList(listOfBeauty, workList, i, 'Belleza');
        addToList(listOfCarWash, workList, i, 'Limpieza Vehiculo');
        addToList(listOfChoresAtHome, workList, i, 'Tarea Domestica');

        String type = workList[i]['tiposervicio'];
        String name = workList[i]['nombre'];
        String date = workList[i]['fechatrabajo'];
        String moreInfo = workList[i]['masinformacion'];
        int reward = workList[i]['preciotrabajo'];

        Work addWork = new Work(name, type, date, moreInfo, reward);
        listOfWorks.add(addWork);
      }

      return listOfWorks;
    } else {
      return null;
    }
  }

  addToList(List<Work> listType, List body, int position, String type) {
    if (body[position]['tiposervicio'] == type) {
      String type = body[position]['tiposervicio'];
      String name = body[position]['nombre'];
      String date = body[position]['fechatrabajo'];
      String moreInfo = body[position]['masinformacion'];
      int reward = body[position]['preciotrabajo'];

      Work addWorkInType = new Work(type, name, date, moreInfo, reward);
      listType.add(addWorkInType);
    }
  }
}
