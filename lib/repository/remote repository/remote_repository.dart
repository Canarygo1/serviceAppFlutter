import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/repository/model/work.dart';

abstract class RemoteRepositoryInterface{
  Future<String> logInUser(String name, String password);
  Future<bool> registerUser(NewUser newUser);
  Future<List<Work>> showList();
}