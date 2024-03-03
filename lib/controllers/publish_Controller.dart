import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towtruck_app/models/feed_model.dart';
import 'package:towtruck_app/models/publish_data_model.dart';
import 'package:towtruck_app/models/response_model.dart';
import 'package:towtruck_app/repository/feed_repo.dart';
import 'package:towtruck_app/repository/publish_repo.dart';

class PublishController extends GetxController {
  final PublishRepo publishRepo;
 PublishController ({required this.publishRepo});
 
  bool _isLoading = false;
  bool get isLoading=> _isLoading;

 
  Future <ResponseModel> postFeed(PublishData publishData) async {
     _isLoading=true;
     update();
    Response response =  await publishRepo.publishData(publishData);
    late ResponseModel responseModel;
    if(response.statusCode==201){
      print("got here");
     responseModel=ResponseModel(true, 'sucess');
      _isLoading = false;
      update();

    }

    else{
      print('did not get product');
    }
    update();
     return responseModel;
 }
}