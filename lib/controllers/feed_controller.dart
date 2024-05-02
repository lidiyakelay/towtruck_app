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
  
  List<FeedBody> _filteredLocations=[];
  List<FeedBody>  get filteredLocations => _filteredLocations;
  
  List <dynamic>_feedList1=[] ;
  bool _isLoaded = false;
  bool get isLoaded=> _isLoaded;

  Future <void> getFeedList() async {
    _isLoaded = false;
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
      filterPostsForLast30Days(_feedList);
      _isLoaded = true;
      update();

    }

    else{
      print('did not get product');
    }
 }
 

 Future<double> calculateDistance(
      double myLatitude, double myLongitude, double lat, double long) async {
    double distanceInMeters = await Geolocator.distanceBetween(
      myLatitude,
      myLongitude,
      lat,
      long,
    );
    print(distanceInMeters);
    // Convert the distance from meters to kilometers
    return distanceInMeters;
  } 
  Future<void> filterLocationsInRange( List<FeedBody> locations, double myLatitude, double myLongitude, double rangeInMeters) async {
     _isLoaded= false;
  _filteredLocations = [];

  for (FeedBody location in locations) {
      double distance = await calculateDistance(
          myLatitude, myLongitude, location.location!.latitude!, location.location!.longitude!);
        
          print(location.location!.latitude.toString() + location.location!.longitude.toString());
      if (distance <= rangeInMeters) {
        _filteredLocations.add(location);
      }
    }
 
    
  
    print('working'+ filteredLocations.length.toString());
   _isLoaded= true;
  
}

List<FeedBody> filterThisWeekFeed(List<FeedBody> entries) {
  // Get the current date
  final now = DateTime.now();
  
  // Calculate the start and end dates of the current week
  final startOfWeek = DateTime(now.year, now.month, now.day - now.weekday + 1);
  final endOfWeek = DateTime(now.year, now.month, now.day - now.weekday + 7);
  
  // Create an empty list to store the filtered entries
  List<FeedBody> thisWeekEntries = [];
  
  // Iterate over each entry in the input list
  for (FeedBody entry in entries) {
    // Parse the timestamp of the entry to a DateTime object
    DateTime? entryDate = DateTime.tryParse(entry.timestamp!); // Assuming date is in ISO 8601 format
    print(entryDate);
    // Check if the parsed DateTime is not null and falls within the current week
    if (entryDate != null &&
        entryDate.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        entryDate.isBefore(endOfWeek)) {
          
      // If the entry is posted within the current week, add it to the filtered list
      thisWeekEntries.add(entry);
    }
  }

  // Return the filtered list of entries for the current week
  return thisWeekEntries;
}
List<FeedBody> filterPostsForLast30Days(List<FeedBody> entries) {
  // Get the current date
  final now = DateTime.now();
  List<FeedBody> thisWeekEntries = [];
  // Calculate the start date for the past 30 days
  final startDate = now.subtract(Duration(days: 30));
  
  // Filter the entries posted within the past 30 days
   thisWeekEntries=entries.where((entry) {
    // Parse the timestamp of the entry to a DateTime object
    DateTime? entryDate = DateTime.tryParse(entry.timestamp!); // Assuming date is in ISO 8601 format
    
    // Check if the parsed DateTime is not null and falls within the past 30 days
    return entryDate != null && entryDate.isAfter(startDate);
  }).toList();
  print('here');
  print(thisWeekEntries);

  return thisWeekEntries;
}
}