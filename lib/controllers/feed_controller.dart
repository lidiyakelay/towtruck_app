import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:towtruck_app/models/feed_model.dart';
import 'package:towtruck_app/repository/feed_repo.dart';

class FeedController extends GetxController {
  final FeedRepo feedRepo;
 FeedController ({required this.feedRepo});
  List <FeedBody> _feedList = [];
  List <FeedBody> get feedList =>  _feedList;
  List <Location> _locationList = [];
  List <Location> get locationList =>  _locationList;
  List <dynamic>_feedList1=[] ;
   List<Location> filteredLocations = [];
  bool _isLoaded = false;
  bool get isLoaded=> _isLoaded;

  Future <void> getFeedList() async {
    Response response =  await feedRepo.getFeedList();
    if(response.statusCode==200){
      print('got here');
      _feedList= [];
      _feedList1=[];
      _feedList1=response.body;
      print(_feedList1);
      for(int i=0; i<_feedList1.length; i++){
        print("got here");
        _feedList.add(FeedBody.fromJson(_feedList1[i]));
      }
      
      print(_feedList);
      _isLoaded = true;
      getLocation(_feedList);
      update();

    }

    else{
      print('did not get product');
    }
 }
 
 List<Location> getLocation( List<FeedBody> feedBody){
     for(int i=0; i<_feedList1.length; i++){
        print("got here");
        _locationList.add(FeedBody.fromJson(_feedList1[i]).location!);
      }
    return _locationList;
 }
 Future<double> calculateDistance(
      double myLatitude, double myLongitude, double lat, double long) async {
    double distanceInMeters = await Geolocator.distanceBetween(
      myLatitude,
      myLongitude,
      lat,
      long,
    );
    // Convert the distance from meters to kilometers
    return distanceInMeters;
  } 
  Future<List<Location>> filterLocationsInRange(
    List<Location> locations, double myLatitude, double myLongitude, double rangeInMeters) async {
    filteredLocations = [];

    for (Location location in locations) {
      double distance = await calculateDistance(
          myLatitude, myLongitude, location.latitude!, location.longitude!);
      if (distance <= rangeInMeters) {
        filteredLocations.add(location);
      }
    }

    return filteredLocations;
  
}}