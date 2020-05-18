
import 'package:http/http.dart';
import 'repository/remote/http_remote_repository.dart';
import 'repository/remote/remote_repository.dart';

class Injector {
  static final instance = Injector._internal();

  Injector._internal(){
    remoteRepository = HttpRemoteRepository(Client());
  }

  RemoteRepository remoteRepository;
}