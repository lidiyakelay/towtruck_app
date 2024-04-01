import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:latlong2/latlong.dart';
import 'package:towtruck_app/controllers/location_controller.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  
 
  final MapController controller = MapController(); 
    List<LatLng> locations = [
  LatLng(40.7128, -74.0060), // New York City, USA
  LatLng(34.0522, -118.2437), // Los Angeles, USA
  LatLng(51.5074, -0.1278), // London, UK
  LatLng(48.8566, 2.3522), // Paris, France
  LatLng(35.6895, 139.6917), // Tokyo, Japan
  LatLng(-33.8688, 151.2093), // Sydney, Australia
  // Add more locations as needed
];
  // Change as per your need 
  LatLng latLng = const LatLng(40.7128, -74.0060);  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController) {
        return Scaffold(
          body: Stack(
          children: [
            Stack(
           children: [
        
             locationController.location==null? CircularProgressIndicator():FlutterMap( 
          mapController: controller, 
          options: MapOptions( 
               initialCenter: LatLng( locationController.location!.latitude, locationController.location!.longitude),
            initialZoom: 3, 
          ), 
          children: [ 
            TileLayer( 
              urlTemplate: "https://api.mapbox.com/styles/v1/towsnitch/cltyw15z901il01nrh9ibakb6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidG93c25pdGNoIiwiYSI6ImNsdHEyczdnOTAxdGIyaXFhdWp1end3M2QifQ.Rswmxd0XKpN8oXwOWHxq3A",
              additionalOptions: const {
                'accessToken':'pk.eyJ1IjoidG93c25pdGNoIiwiYSI6ImNsdHEyczdnOTAxdGIyaXFhdWp1end3M2QifQ.Rswmxd0XKpN8oXwOWHxq3A',
                'id':'mapbox.mapbox-streets-v8'
              },
            ), 
          
            MarkerLayer(
          markers: [
        for (LatLng location in locations)
          Marker(
            point: location,
            child: Icon(Icons.location_pin, color: Colors.red,size: 20,),
                
          
          ),
          ],
        )
        
            
          ], 
        ),
            /* Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(top: 20, left: 20, right: 20) ,
              decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
              ),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                  Container(
              margin: EdgeInsets.only(left: 10,right: 10, bottom: 50),
              height:80 ,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.white),
               child: Row(
                children: [
                  Container(
                    height:65,
                    width: MediaQuery.of(context).size.width/4,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                image:DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/truck.png')) ,
                ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                                children: [
                                  Icon(Icons.location_on, size: 16,color: Colors.red,),
                                  SizedBox(width: 5,),
                                  Text('Texas, Interstate 105 ...',style:
                                    TextStyle(
                                    color: Color.fromARGB(176, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    decoration: TextDecoration.none
                                  ),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_month,size: 16, color: Colors.green,),
                                  SizedBox(width: 5,),
                                  Text('Jan 25 2024',style:
                                    TextStyle(
                                    color: Color.fromARGB(176, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    decoration: TextDecoration.none
                                  ),)
                                ],
                              ),
                                 Row(
                                    children: [
                                      Icon(Icons.lock_clock, size: 16, color: Colors.orange,),
                                      SizedBox(width: 5,),
                                      Text('08:24 pm',style:
                                        TextStyle(
                                        color: Color.fromARGB(176, 0, 0, 0),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        decoration: TextDecoration.none
                                      ),),
                                       
                                    ],
                                  ),
                    
                      ],
                    ),
                  ) ],
               ),
              )
                ],
              ),
            ), */
           ],
        ),
          
          ])
        );
      }
    );
  }
}