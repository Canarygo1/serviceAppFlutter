import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreen createState() => _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: listActivity(),
    );
  }
}

Widget listActivity() {
  return Scaffold(
    backgroundColor: Color.fromRGBO(44, 45, 47, 1),
    body: Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.youtube_searched_for,
                      color: Colors.white,
                    ),
                    orderBySelector('Dia'),
                    orderBySelector('Precio'),
                    orderBySelector('Distancia')
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildCategories('Lavado de coches'),
                      buildCategories('Belleza'),
                      buildCategories('Tareas domesticas'),
                    ],
                  ),
                ),
                labelTitle('Populares', Icons.star, Colors.yellow),
                showActivities(),
                labelTitle('Para ti', Icons.favorite, Colors.red),
                showActivities(),
              ],
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Map'),
        ),
      ],
      onTap: (index) {
        //_presenter.onOptionClicked(index);
      },
      //currentIndex: _selectedIndex,
    ),
  );
}

Widget buildCategories(String categoryName /*, Icon categoryIcon*/) {
  return SizedBox(
    width: 130,
    height: 120,
    child: Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
              color: Color.fromRGBO(44, 45, 47, 1),
              child: SizedBox(
                width: 108,
                child: CircleAvatar(
                backgroundImage: new NetworkImage(
                    'https://cdn.mos.cms.futurecdn.net/YdAaqJNxhLZ66zmRZ3T58D.jpg'),
                radius: 40.0,
              ),
              ),
            ),
            Text(
              categoryName,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget showActivities() {
  return Row(
    children: <Widget>[
      SizedBox(
        width: 410,
        height: 200,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: buildActivities,
        ),
      ),
    ],
  );
}

Widget buildActivities(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 20,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Paco González',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  size: 100,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Belleza',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('24/2/2020'),
                    Text('13:00'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget orderBySelector(String orderBy) {
  var orderSelector;
  orderSelector = Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        padding: const EdgeInsets.all(10),
        decoration: new BoxDecoration(
            color: Color.fromRGBO(44, 45, 47, 1),
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(width: 1, color: Colors.white)),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.details,
              size: 15,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                orderBy,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ],
  );
  return orderSelector;
}

Widget labelTitle(String title, IconData icon, Color color) {
  var orderSelector = Container(
    margin: const EdgeInsets.only(top: 10),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Text(
          ' ' + title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    ),
  );
  return orderSelector;
}
