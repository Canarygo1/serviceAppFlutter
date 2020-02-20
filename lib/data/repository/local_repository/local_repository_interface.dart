import 'package:http/http.dart';
import 'package:serviceapp/model/Response.dart';

abstract class LocalRepositoryInterface{
  Future<String> saveToken(String token);
  Future<bool> removeToken();
  Future<String> getToken();
}