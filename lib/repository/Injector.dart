import 'package:http/http.dart';
import 'package:serviceapp/repository/remote%20repository/http_remote_repository.dart';
import 'package:serviceapp/repository/remote%20repository/remote_repository.dart';

class Injector{
  static final instance = Injector();

  RemoteRepositoryInterface remoteRepository;
  //LocalRepositoryInterface localRepository;

  Injector(){
    remoteRepository = HttpRemoteRepository(Client());
    //localRepository = PreferencesLocalRepository();
  }
}