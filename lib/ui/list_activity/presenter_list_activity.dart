import 'package:serviceapp/data/model/work.dart';
import 'package:serviceapp/data/repository/remote/http_remote_repository.dart';

class ListPresenter {
  final HttpRemoteRepository _remoteRepository;
  final ListExtension _view;
  List listOfWorks = [];
  List beautyList = [];
  List homeChoresList = [];
  List carWashList = [];


  ListPresenter(this._view, this._remoteRepository);

   init() async {
   listOfWorks = await _remoteRepository.showList();

   print('Estoy esperando');
   beautyList = _remoteRepository.listOfBeauty;
   carWashList = _remoteRepository.listOfCarWash;
   homeChoresList = _remoteRepository.listOfChoresAtHome;


   _view.showList(listOfWorks, beautyList,carWashList ,homeChoresList);
   print(listOfWorks.length);
  }
}

abstract class ListExtension {
  showList(List<Work> listAll, List<Work> beautyList, List<Work> carWashList, List<Work> homeChoresList,);
}
