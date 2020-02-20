import 'package:serviceapp/model/Response.dart';
import 'package:serviceapp/model/jsonPostLogin.dart';

abstract class RemoteRepository {
  Future<ApiLoginResponse> postLogin(JsonPostLogin jsonPostLogin) {}
}
