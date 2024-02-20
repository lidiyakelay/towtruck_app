import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:towtruck_app/Screen/home_page/home_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Welcome to Lorem', style:
             TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              decoration: TextDecoration.none
             ),),
             Column(
              children: [
                  Padding(  
                padding: EdgeInsets.only(left:30, right: 30, top: 30),  
                child: TextField(  
                  style: TextStyle(fontSize: 12),
                  cursorColor: Colors.grey, 
                  decoration: InputDecoration(  
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1, color: Colors.grey), ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1, color: Colors.grey), ),
                    border: OutlineInputBorder(),  
                    labelText: 'Username',  
                    prefixIcon: Icon(Icons.person, color: Colors.amber,),
                     labelStyle: TextStyle(
                   color: Colors.grey,  ),
                  ),  
                ),  
              ),
              Padding(  
                padding: EdgeInsets.only(left:30, right: 30, top: 30),  
                child: TextField(  
                  style: TextStyle(fontSize: 12),
                  cursorColor: Colors.grey,
                  obscureText: true,  
                  decoration: InputDecoration(  
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1, color: Colors.grey), ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1, color: Colors.grey), ),
                    border: OutlineInputBorder(),  
                    labelText: 'Password',  
                    prefixIcon: Icon(Icons.lock, color: Colors.amber,),
                     labelStyle: TextStyle(
                   color: Colors.grey,  ),
                  ),  
                ),  
              ),
              Padding(  
                padding: EdgeInsets.only(left:30, right: 30, top: 30),  
                child: TextField(  
                  style: TextStyle(fontSize: 12),
                  cursorColor: Colors.grey,
                  obscureText: true,  
                  decoration: InputDecoration(  
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1, color: Colors.grey), ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1, color: Colors.grey), ),
                    border: OutlineInputBorder(),  
                    labelText: 'Confirm Password',  
                    prefixIcon: Icon(Icons.lock, color: Colors.amber,),
                     labelStyle: TextStyle(
                   color: Colors.grey,  ),
                  ),  
                ),  
              ),
              ],
             ),
             GestureDetector(
              onTap: () {
                Get.to(HomePage());
              },
               child: Container(
                  height: 50,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 30,right: 30, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(228, 0, 0, 0),
                  ),
                  child: Center(
                    child: Text('Sign Up',style:
                                 TextStyle(
                                  color: Color.fromARGB(255, 244, 241, 241),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.none
                                 ), )
                  ),
                ),
             ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( "Have an account?", style:
                  TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  decoration: TextDecoration.none),),
                  SizedBox(width: 5,),
                   Text( "Sign In", style:
                  TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  decoration: TextDecoration.none),),
                ],
              )
             ],
      ),
    );
  }
}