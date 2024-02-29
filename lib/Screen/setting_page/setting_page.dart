import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towtruck_app/Screen/auth_page/login_page.dart';
import 'package:towtruck_app/controllers/auth_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
        bool userLoggedIn=Get.find<AuthController>().userLoggedIn();
    return GetBuilder<AuthController>(
      builder: (authController) {
        return userLoggedIn? Scaffold(
          backgroundColor: Color(0XFFDADADA),
          body: Column(
            children: [
               Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40,bottom: 30),
                child: Row(
                  children: [
                    Icon(Icons.settings, color: const Color.fromARGB(210, 0, 0, 0),),
                    SizedBox(width: 10,),
                    Text('Settings', style: TextStyle(
                                          color: Color.fromARGB(176, 0, 0, 0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          decoration: TextDecoration.none
                                        ),)
                  ],
                ),
                
              ),
              Container(
                height: 250,
                 padding: EdgeInsets.only(left: 20, right: 20,top: 30),
                 child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, size:20,color: const Color.fromARGB(210, 0, 0, 0),),
                        SizedBox(width: 15,),
                        Text('Profile', style: TextStyle(
                                              color: Color.fromARGB(176, 0, 0, 0),
                                              fontWeight:FontWeight.w500,
                                              fontSize: 16,
                                              decoration: TextDecoration.none
                                            ),)
                      ],
                    ),
                     Icon(Icons.arrow_forward_ios, size:18,color: const Color.fromARGB(210, 0, 0, 0),),
                     
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.language, size:20,color: const Color.fromARGB(210, 0, 0, 0),),
                        SizedBox(width: 15,),
                        Text('Language', style: TextStyle(
                                              color: Color.fromARGB(176, 0, 0, 0),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              decoration: TextDecoration.none
                                            ),)
                      ],
                    ),
                     Icon(Icons.arrow_forward_ios, size:18,color: const Color.fromARGB(210, 0, 0, 0),),
                     
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, size:20,color: const Color.fromARGB(210, 0, 0, 0),),
                        SizedBox(width: 15,),
                        Text('Enable Location', style: TextStyle(
                                              color: Color.fromARGB(176, 0, 0, 0),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              decoration: TextDecoration.none
                                            ),)
                      ],
                    ),
                     Icon(Icons.arrow_forward_ios, size:18,color: const Color.fromARGB(210, 0, 0, 0),),
                     
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.notifications, size:20,color: const Color.fromARGB(210, 0, 0, 0),),
                        SizedBox(width: 15,),
                        Text('Enable Notification', style: TextStyle(
                                              color: Color.fromARGB(176, 0, 0, 0),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              decoration: TextDecoration.none
                                            ),)
                      ],
                    ),
                     Icon(Icons.arrow_forward_ios, size:18,color: const Color.fromARGB(210, 0, 0, 0),),
                     
                  ],
                ), 
                 GestureDetector(
                   onTap: (){
                                  if(authController.userLoggedIn()){
                                   authController.clearSharedData();
                                   authController.userLoggedIn();
                                  }
                   },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.logout, size:20,color: const Color.fromARGB(210, 0, 0, 0),),
                          SizedBox(width: 15,),
                          Text('Log out', style: TextStyle(
                                                color: Color.fromARGB(176, 0, 0, 0),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                decoration: TextDecoration.none
                                              ),)
                        ],
                      ),
                   
                       
                    ],
                               ),
                 ),
                  ],
                 ) ,
              )],
          ),
        ):LoginPage();
      }
    );
  }
}