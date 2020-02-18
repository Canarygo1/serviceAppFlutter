import 'package:serviceapp/repository/model/user.dart';

abstract class RemoteRepositoryInterface{
  Future<String> logInUser(String name, String password);
  Future<bool> registerUser(NewUser newUser);
}