import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:towtruck_app/Screen/home_page/home_page.dart';
import 'package:towtruck_app/Screen/auth_page/login_page.dart';
import 'package:towtruck_app/Screen/auth_page/signup_page.dart';
import 'package:towtruck_app/Screen/detail_view_page/detail_view_page.dart';
import 'package:towtruck_app/Screen/detail_view_page/map_view_page.dart';
import 'package:towtruck_app/Screen/home_page/most_recent_page.dart';
import 'package:towtruck_app/Screen/home_page/main_page.dart';
import 'package:towtruck_app/Screen/initial_pages/initial_page.dart';
import 'package:towtruck_app/Screen/notification_page/notification_page.dart';
import 'package:towtruck_app/Screen/publish_post_page/publish_post_page.dart';
import 'package:towtruck_app/Screen/setting_page/setting_page.dart';
import 'helper/dependecies.dart' as dep;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home:InitialPage());
  }
}



