import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:towtruck_app/Screen/auth_page/login_page.dart';
import 'package:towtruck_app/Screen/auth_page/signup_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
       children: [
         Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/truck.png')
            )
          ),
        ),
        Container(
          color: Color.fromARGB(206, 0, 0, 0),
        ),
       ],
    ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Text('Welcome to Lorem', style:
             TextStyle(
              color: Color.fromARGB(235, 237, 237, 237),
              fontWeight: FontWeight.bold,
              fontSize: 24,
              decoration: TextDecoration.none
             ),),
             Column(children: [
              GestureDetector(
                onTap: () {
                  Get.to(SignupPage());
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(78, 255, 255, 255),
                  ),
                  child: Center(
                    child: Text('Sign Up',style:
                                 TextStyle(
                                  color: Color.fromARGB(235, 237, 237, 237),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.none
                                 ), )
                  ),
                ),
              ),
              GestureDetector
              (
                onTap: () {
                  Get.to(LoginPage());
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(78, 255, 255, 255),
                  ),
                  child: Center(
                    child: Text('Sign In',style:
                                 TextStyle(
                                  color: Color.fromARGB(235, 237, 237, 237),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.none
                                 ), )
                  ),
                ),
              ),
           
             ],),
                Text('join as a guest', style:
             TextStyle(
              color: Color.fromARGB(235, 237, 237, 237),
              fontWeight: FontWeight.bold,
              fontSize: 14,
              decoration: TextDecoration.none
             ),)
        ],
      )
      ]);
    
    
  }
}