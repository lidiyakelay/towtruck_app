import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:towtruck_app/Components/big_text.dart';

void showCustomSnackbar(String message, {bool isError=true, String title='Error'}){
  Get.snackbar(title,message,
  titleText: BigText(text: title, color: Colors.white,),
  messageText: Text(message,style: const TextStyle(
    color: Colors.white,
  ),),
  colorText: Colors.white,
   backgroundColor: Colors.redAccent
  );
}