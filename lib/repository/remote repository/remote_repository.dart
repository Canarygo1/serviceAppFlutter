import 'package:serviceapp/repository/model/user.dart';
import 'package:serviceapp/repository/model/work.dart';

abstract class RemoteRepositoryInterface{
  Future<bool> registerUser(NewUser newUser);
  Future<List<Work>> showList();
}