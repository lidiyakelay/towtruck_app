import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:towtruck_app/controllers/location_controller.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({Key? key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  final MapController controller = MapController();
  double radius = 5000; // Set initial radius to 5000 meters
  Position? userLocation;
  double zoom=18;
  List<LatLng> locations = [
    LatLng(8.5517, 39.2718), // Adama, Ethiopia
    LatLng(8.5416, 39.2722), // Adama University, Adama, Ethiopia
    LatLng(8.5469, 39.2689), // Meskel Square, Adama, Ethiopia
    LatLng(8.5372, 39.2618), // Adama Science and Technology University, Adama, Ethiopia
    LatLng(8.5347, 39.2723), // Adama Stadium, Adama, Ethiopia
    LatLng(8.5517, 39.2653), // Selassie Church, Adama, Ethiopia
  ];

  @override
  void initState() {
    super.initState();
    userLocation = Get.find<LocationController>().location;
  }
  
  double calculateZoomLevel(double radius) {
    double zoomLevel = 18.0;
    if (radius <= 100) {
      zoomLevel = 18.0;
    } else if (radius <= 500) {
      zoomLevel = 16.0;
    } else if (radius <= 1000) {
      zoomLevel = 14.0;
    } else if (radius <= 2000) {
      zoomLevel = 12.0;
    } else {
      zoomLevel = 10.0;
    }
    return zoomLevel;
  }
  double calculateCircleRadius(double radius, double zoom) {
  // Calculate the scale factor based on the zoom level
  // Adjust the scaleFactor value as needed to achieve the desired visual effect
  double scaleFactor = 100000 / pow(2, zoom);

  // Calculate the circle radius by scaling the input radius with the scaleFactor
  double circleRadius = (radius * scaleFactor)/10;

  return circleRadius;
} 



  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController) {
        return Scaffold(
          body: Stack(
            children: [
              locationController.location == null
                  ? CircularProgressIndicator()
                  : FlutterMap(
                      mapController: controller,
                      options: MapOptions(
                        center: LatLng(
                          locationController.location!.latitude,
                          locationController.location!.longitude,
                        ), // Initial center at Addis Ababa, Ethiopia
                        zoom: zoom, // Initial zoom level
                        minZoom: 3,
                        maxZoom: 18.0,
                        interactiveFlags: InteractiveFlag.pinchZoom |
                            InteractiveFlag.doubleTapZoom |
                            InteractiveFlag.drag,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/towsnitch/cltyw15z901il01nrh9ibakb6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidG93c25pdGNoIiwiYSI6ImNsdHEyczdnOTAxdGIyaXFhdWp1end3M2QifQ.Rswmxd0XKpN8oXwOWHxq3A",
                          additionalOptions: {
                            'accessToken':
                                'pk.eyJ1IjoidG93c25pdGNoIiwiYSI6ImNsdHEyczdnOTAxdGIyaXFhdWp1end3M2QifQ.Rswmxd0XKpN8oXwOWHxq3A',
                            'id': 'mapbox.mapbox-streets-v8'
                          },
                        ),
                        MarkerLayer(
                          markers: [
                            // Add user's location as a marker
                            Marker(
                              point: LatLng(
                                userLocation!.latitude,
                                userLocation!.longitude,
                              ),
                              child: Icon(
                                Icons.person_pin_circle,
                                color: Colors.blue,
                                size: 25,
                              ),
                            ),
                            // Add filtered locations within the circular area
                            ...locations
                                .where((location) =>
                                    Geolocator.distanceBetween(
                                            userLocation!.latitude,
                                            userLocation!.longitude,
                                            location.latitude,
                                            location.longitude) <=
                                        radius)
                                .map((location) => Marker(
                                      point: location,
                                      child: const Icon(
                                        Icons.location_pin,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ))
                          ],
                        ),
                        CircleLayer(
                          circles: [
                            CircleMarker(
                              point: LatLng(
                                userLocation!.latitude,
                                userLocation!.longitude,
                              ),
                              radius: calculateCircleRadius(radius,zoom),
                              color: Colors.blue.withOpacity(0.3),
                              borderStrokeWidth: 2,
                              borderColor: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(136, 24, 24, 24),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        Text(
                          'Distance: ${radius.toStringAsFixed(2)} meters', // Show radius value as text
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Slider(
                          value: radius,
                          min: 10,
                          max: 10000,
                          divisions: 99,
                          activeColor: Colors.amber,
                          inactiveColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              radius = value;
                              controller.move(
                                LatLng(
                                  userLocation!.latitude,
                                  userLocation!.longitude,
                                ),
                                calculateZoomLevel(radius),
                              );
                            });
                          },
                        ),
                         Text('You can see near by tow trucks by adjusting your location.',  style: TextStyle(color: const Color.fromARGB(255, 173, 173, 173), fontSize: 10), ),
                      ],
                    ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
