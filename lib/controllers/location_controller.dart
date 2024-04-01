import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:towtruck_app/base/show_custom_snackbar.dart';

class LocationController extends GetxController { 
  // RxString to observe changes in the text 
  String? _currentAddress;
  Position? _currentPosition;
  Position? get location=> _currentPosition;
     
     Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
       showCustomSnackbar('Location services are disabled. Please enable the services', title: 'Location');
     
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
         showCustomSnackbar('Location permissions are denied', title: 'Location');
      
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
       showCustomSnackbar( 'Location permissions are permanently denied, we cannot request permissions.', title: 'Location');
      
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
    
        _currentAddress =
         '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
     
    }).catchError((e) {
      debugPrint(e);
    });
  }
}