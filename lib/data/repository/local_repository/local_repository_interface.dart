import 'package:http/http.dart';


abstract class LocalRepositoryInterface{
  Future<String> saveToken(String token);
  Future<bool> removeToken();
  Future<String> getToken();
}