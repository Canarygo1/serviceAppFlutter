import 'package:serviceapp/data/model/jsonPostLogin.dart';
import 'package:serviceapp/data/model/user.dart';
import 'package:serviceapp/data/model/work.dart';


abstract class RemoteRepository {
  Future<String> postLogin(JsonPostLogin jsonPostLogin);
  Future<bool> registerUser(NewUser newUser);
  Future<List<Work>> showList();
}
