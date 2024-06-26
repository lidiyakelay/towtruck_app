import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:towtruck_app/Screen/auth_page/otp_page.dart';
import 'package:towtruck_app/Screen/home_page/home_page.dart';
import 'package:towtruck_app/Screen/initial_pages/initial_page.dart';
import 'package:towtruck_app/controllers/auth_controller.dart';
import 'package:towtruck_app/controllers/feed_controller.dart';
import 'controllers/location_controller.dart';
import 'helper/dependecies.dart' as dep;
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
    bool userLoggedIn=Get.find<AuthController>().userLoggedIn();
  Future<void> _loadResource() async   {
    if(userLoggedIn){
       await  Get.find<LocationController>().getCurrentPosition();
       print(Get.find<LocationController>().location);
       await Get.find<FeedController>().getFeedList();
       var locationController = await  Get.find<LocationController>().location;
       var locationList =  await Get.find<FeedController>().feedList;
       await Get.find<FeedController>().filterLocationsInRange(locationList, locationController!.latitude, locationController!.longitude, 20000);
    }
    else{
      await  Get.find<LocationController>().getCurrentPosition();
       print(Get.find<LocationController>().location);
    }
   
          }
  
  @override
  void initState() {
    super.initState();
    _loadResource();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        visualDensity: VisualDensity.adaptivePlatformDensity, 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: userLoggedIn?HomePage():InitialPage(),
       
      );
  }
}



