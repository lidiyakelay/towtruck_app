import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:towtruck_app/api/api_client.dart';
import 'package:towtruck_app/repository/auth_repo.dart';
import 'package:towtruck_app/utils/app_constants.dart';

import '../controllers/auth_controller.dart';


Future <void> init()async{
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.BaseUrl,sharedPreferences:Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),sharedPreferences:Get.find()) );
  Get.lazyPut(() => AuthController(authRepo: Get.find()));


}