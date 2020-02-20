import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
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
                Text("Nombre: ", style: TextStyle(color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text("Tipo de servicio", style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.star),
                Text("Valoracion: ", style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Descripcion: ", style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Fecha: ", style: TextStyle(color: Colors.white)),
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
                    onPressed: () {},
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
