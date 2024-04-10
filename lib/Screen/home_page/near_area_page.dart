import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:towtruck_app/Screen/detail_view_page/detail_view_page.dart';
import 'package:towtruck_app/controllers/feed_controller.dart';
import 'package:towtruck_app/controllers/location_controller.dart';

import '../../models/feed_model.dart';

class NearAreaPage extends StatefulWidget {
  const NearAreaPage({super.key});

  @override
  State<NearAreaPage> createState() => _NearAreaPageState();
}

class _NearAreaPageState extends State<NearAreaPage> {
  Position? userLocation;
  late List<Location> locations;
    void initState() {
    super.initState();
    userLocation = Get.find<LocationController>().location;
     }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      builder: (feedController) {
        if(feedController.filteredLocations!=null){
          feedController.filterLocationsInRange(locations, userLocation!.latitude, userLocation!.longitude, 10000);
        return feedController.locationList==null? Center(child: CircularProgressIndicator()):Column(
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailViewPage());
              },
              child: Container(
                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                height:80 ,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  color: Colors.white),
                 child: Row(
                  children: [
                    Container(
                      height:80,
                      width: MediaQuery.of(context).size.width/3.2,
                      decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  image:DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/truck2.png')) ,
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
                    )
                  ],
                 ),
                ),
            );
            }),
          );
      }
      else{
        return Center(child: CircularProgressIndicator());
      }
      }
    );
  }
}