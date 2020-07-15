import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  List<Marker> allMarkers = [];
 
  setMarkers() {
    allMarkers.add(
        Marker(
           width: 45.0,
           height: 45.0,
           point: LatLng(31.6341600, -7.9999400),
           builder: (context) => Container(
                    child: IconButton(
                    icon: Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: () {
                       print('Marker tapped');
                     },
                   ),
                ))
    );
    return allMarkers;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title:  Text('Les offres'),
          backgroundColor: Colors.indigo[300],
          centerTitle: true,
        ),
        body:  FlutterMap(
            options:  MapOptions(
                center: LatLng(31.6341600, -7.9999400 ), minZoom: 0.0, maxZoom: 20.00),
            layers: [
               TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
               MarkerLayerOptions(markers: setMarkers())
            ]
        )
    );
  }
}