import 'package:flutter/material.dart';
import 'package:serviceapp/data/model/work.dart';


class DetailScreen extends StatefulWidget {
  final Work work;

  DetailScreen(this.work);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 45, 47, 1),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 90,
                color: Color.fromRGBO(230, 73, 90, 1),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.hourglass_full),
                    Text("Time app", style: TextStyle(color: Colors.white)),
                  ],
                )),
            Row(
              children: <Widget>[
                Expanded(
                  child: Image(
                      fit: BoxFit.fill,
                      height: 200,
                      width: 100,
                      image: ExactAssetImage("assets/${widget.work.name}.jpg")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Tipo: ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(widget.work.name, style: TextStyle(color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text("Nombre: ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(widget.work.type, style: TextStyle(color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text("Descripcion: ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(widget.work.moreInfo,
                    style: TextStyle(color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text("Fecha: ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(widget.work.date.substring(0, 10),
                    style: TextStyle(color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                  child: RaisedButton(
                    child: Text(
                      'Contratar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () => {},
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
