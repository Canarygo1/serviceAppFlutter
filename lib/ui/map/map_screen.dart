import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController _controller;
  Position position;
  Widget _child;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  changeMapMode() {
    getJsonFile("assets/map_style.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    print("Cambiando estilo de mapa");
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    print("Me ha llamado");
    _controller.setMapStyle(mapStyle);
  }

  void getCurrentLocation() async {
    print("ESTOY ESPERANDO LOCALIZACION");
    Position res = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("MI POSICION ES ESTA: " +
        res.latitude.toString() +
        ", " +
        res.longitude.toString() +
        '/n/n/n/n/n/n/n');
    setState(() {
      position = res;
      _child = mapWidget();
    });
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("Yo"),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: "ESTE SOY YO")),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _child,
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 12.0),
      markers: _createMarker(),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        print("LLEGO AQUI CON POSICION: " +
            position.latitude.toString() +
            " y " +
            position.longitude.toString());
        changeMapMode();
        setState(() {});
      },
    );
  }
}
