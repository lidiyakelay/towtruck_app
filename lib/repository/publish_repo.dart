import 'package:get/get.dart';
import 'package:towtruck_app/api/api_client.dart';
import 'package:towtruck_app/models/publish_data_model.dart';
import 'package:towtruck_app/utils/app_constants.dart';

class PublishRepo extends GetxService{
  final ApiClient apiClient;
PublishRepo({required this.apiClient});
  Future<Response> publishData(PublishData publishData) async{
    return await apiClient.publishData("https://tow.henonfm.com"+AppConstants.PhotoUrl, publishData.toJson());
  }

}