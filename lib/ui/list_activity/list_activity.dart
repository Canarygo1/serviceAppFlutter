import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serviceapp/data/model/work.dart';
import 'package:serviceapp/ui/list_activity/presenter_list_activity.dart';
import '../../data/Injector.dart';
import '../DetailScreen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreen createState() => _ListScreen();
}

class _ListScreen extends State<ListScreen> implements ListExtension {
  List<Work> listOfWork = [];
  List<Work> beautyList = [];
  List<Work> carWashList = [];
  List<Work> homeChoresList = [];
  int index = 0;
  ListPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = ListPresenter(this/*, Injector.instance.remoteRepository*/);
    _presenter.init();
  }

  @override
  showList(List<Work> listAll, List<Work> beautyList, List<Work> carWashList,
      List<Work> homeChoresList) {
    setState(() {
      this.listOfWork = listAll;
      this.beautyList = beautyList;
      this.carWashList = carWashList;
      this.homeChoresList = homeChoresList;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 45, 47, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 90,
                color: Color.fromRGBO(230, 73, 90, 1),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.hourglass_full),
                      Text("TimeAPP")
                    ],
                  ),
                ),
              ),
              titleList('Cercanas', Icons.location_on),
              workList(listOfWork),
              titleList('Belleza', Icons.remove_red_eye),
              workList(beautyList),
              titleList('Limpieza Vehiculo', Icons.directions_car),
              workList(carWashList),
              titleList('Tarea Domestica', Icons.home),
              workList(homeChoresList),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleList(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.white),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget workList(List<Work> list) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24.0),
      height: 150,
      color: Color.fromRGBO(35, 35, 35, 1),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(list[index])))
              },
              child: Container(
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(7, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                list[index].type,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14.0),
                              ),
                              Text(
                                list[index].name,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.0),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.calendar_today,
                                    size: 12,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 6),
                                    child: Text(
                                      list[index].date.substring(0, 10),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
