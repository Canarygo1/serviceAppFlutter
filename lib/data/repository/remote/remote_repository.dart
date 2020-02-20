import 'package:serviceapp/model/Response.dart';
import 'package:serviceapp/model/jsonPostLogin.dart';

abstract class RemoteRepository {
  Future<String> postLogin(JsonPostLogin jsonPostLogin) {}
}
