import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final MapController controller = MapController(); 
    
  // Change as per your need 
  LatLng latLng = const LatLng(40.7128, -74.0060);  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body:FlutterMap( 
      mapController: controller, 
      options: MapOptions( 
        initialCenter: latLng, 
        initialZoom: 18, 
      ), 
      children: [ 
        TileLayer( 
          urlTemplate: "https://api.mapbox.com/styles/v1/towsnitch/cltyw15z901il01nrh9ibakb6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidG93c25pdGNoIiwiYSI6ImNsdHEyczdnOTAxdGIyaXFhdWp1end3M2QifQ.Rswmxd0XKpN8oXwOWHxq3A",
          additionalOptions: {
            'accessToken':'pk.eyJ1IjoidG93c25pdGNoIiwiYSI6ImNsdHEyczdnOTAxdGIyaXFhdWp1end3M2QifQ.Rswmxd0XKpN8oXwOWHxq3A',
            'id':'mapbox.mapbox-streets-v8'
          },
        ), 
      ], 
    )
    );
  }
}