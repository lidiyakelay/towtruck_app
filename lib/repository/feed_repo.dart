
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:towtruck_app/api/api_client.dart';
import 'package:towtruck_app/utils/app_constants.dart';

class FeedRepo extends GetxService{
  final ApiClient apiClient;
FeedRepo({required this.apiClient});
  Future<Response> getFeedList() async{
    return await apiClient.getData(AppConstants.BaseUrl+AppConstants.FeedUrl);
  }
  
}