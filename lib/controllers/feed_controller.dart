import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towtruck_app/models/feed_model.dart';
import 'package:towtruck_app/repository/feed_repo.dart';

class FeedController extends GetxController {
  final FeedRepo feedRepo;
 FeedController ({required this.feedRepo});
  List <FeedBody> _feedList = [];
  List <FeedBody> get feedList =>  _feedList;
  List <dynamic>_feedList1=[] ;
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
      update();

    }

    else{
      print('did not get product');
    }
 }

}