import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart';
import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/repository/model/work.dart';
import 'package:serviceapp/repository/remote%20repository/remote_repository.dart';

class HttpRemoteRepository implements RemoteRepositoryInterface {
  final Client _client;
  List<Work> listOfWorks = [];
  List<Work> listOfBeauty = [];
  List<Work> listOfCarWash = [];
  List<Work> listOfChoresAtHome = [];

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

        print('TAMAÑO DE BELLEZA: ' + listOfBeauty.length.toString());
        print('TAMAÑO DE TAREA DOMESTICAS: ' +
            listOfChoresAtHome.length.toString());
        print('TAMAÑO DE LAVADO DE COCHES: ' + listOfCarWash.length.toString());
        print('TAMAÑO TOTAL: ' + listOfWorks.length.toString());
      }
      print(listOfWorks);

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
