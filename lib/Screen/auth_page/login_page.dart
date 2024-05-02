import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:towtruck_app/Screen/auth_page/signup_page.dart';
import 'package:towtruck_app/Screen/home_page/home_page.dart';
import 'package:towtruck_app/base/show_custom_snackbar.dart';
import 'package:towtruck_app/controllers/auth_controller.dart';
import 'package:towtruck_app/controllers/feed_controller.dart';
import 'package:towtruck_app/controllers/location_controller.dart';
import 'package:towtruck_app/models/signin_body_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
   Future<void> _loadResource() async   {
    await  Get.find<LocationController>().getCurrentPosition();
    print(Get.find<LocationController>().location);
     await Get.find<FeedController>().getFeedList();
     var locationController = await  Get.find<LocationController>().location;
     var locationList =  await Get.find<FeedController>().feedList;
    await Get.find<FeedController>().filterLocationsInRange(locationList, locationController!.latitude, locationController!.longitude, 20000);
          }
  @override
  Widget build(BuildContext context) {
    var phoneController= TextEditingController();
    var passwordController= TextEditingController();
    void login(AuthController authController){
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if(phone.isEmpty){
        showCustomSnackbar('Type in your phone', title: 'Phone');
      }
      else if(password.isEmail){
        showCustomSnackbar('Type in your password', title: 'Password');
      }
      else if(password.length<6){
        showCustomSnackbar("Password can't be less than six characters", title: 'Password');
      }

      else{
        SignInBody signInBody= SignInBody(phone: phone, password: password,);
        print(phone +"    "+ password);
        authController.login(signInBody).then((status) async {
          if(status.isSuccess){
            print('here successs');
            Get.to(() =>HomePage());
            await _loadResource();
            
          }
          else{
            showCustomSnackbar(status.message);
            
            print('here unsuccesss');
          }
        });
      }


    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GetBuilder<AuthController>(builder: (authController) {
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
                        controller: phoneController,
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
                         controller: passwordController,
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
                    ],
                   ),
                   GestureDetector(
                    onTap: () {
                      login(authController);
                      print('here');
                      
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
                          child: Text('Sign In',style:
                                       TextStyle(
                                        color: Color.fromARGB(255, 244, 241, 241),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        decoration: TextDecoration.none
                                       ), )
                        ),
                      ),
                   ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text( "Don't have an account?", style:
                        TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        decoration: TextDecoration.none),),
                        SizedBox(width: 5,),
                         GestureDetector(
                           onTap: () {
                             Get.to(SignupPage());
                           },
                           child: Text( "Sign Up", style:
                                                   TextStyle(
                                                   color: Colors.amber,
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 14,
                                                   decoration: TextDecoration.none),),
                         ),
                      ],
                    )
                   ],
            ),
          );
        }
      ),
    );
  }
}