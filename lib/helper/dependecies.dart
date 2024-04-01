import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:towtruck_app/api/api_client.dart';
import 'package:towtruck_app/controllers/feed_controller.dart';
import 'package:towtruck_app/controllers/location_controller.dart';
import 'package:towtruck_app/controllers/publish_Controller.dart';
import 'package:towtruck_app/repository/auth_repo.dart';
import 'package:towtruck_app/repository/feed_repo.dart';
import 'package:towtruck_app/repository/publish_repo.dart';
import 'package:towtruck_app/utils/app_constants.dart';

import '../controllers/auth_controller.dart';


Future <void> init()async{
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.BaseUrl,sharedPreferences:Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),sharedPreferences:Get.find()) );
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => FeedController(feedRepo: Get.find()));
  Get.lazyPut(() => FeedRepo(apiClient: Get.find()) );
  Get.lazyPut(() => PublishController(publishRepo: Get.find()));
  Get.lazyPut(() => PublishRepo(apiClient: Get.find()) );
  Get.lazyPut(() => LocationController()); 


}