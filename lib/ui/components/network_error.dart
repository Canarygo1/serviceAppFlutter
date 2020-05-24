import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serviceapp/ui/components/textTypes/large_text.dart';
import 'package:serviceapp/ui/components/textTypes/medium_text.dart';

class NetworkError extends StatefulWidget {
  @override
  _NetworkErrorState createState() => _NetworkErrorState();
}

class _NetworkErrorState extends State<NetworkError> {
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.2),
      child: Center(
        child: Column(
          children: <Widget>[
            LargeText("¡Vaya! Parece que no tienes internet"),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: SvgPicture.asset("assets/images/ufo.svg"),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: MediumText("No podemos obtener los datos."),
            ),
            MediumText("Por favor revisa tu conexión a internet")
          ],
        ),
      ),
    );
  }
}
