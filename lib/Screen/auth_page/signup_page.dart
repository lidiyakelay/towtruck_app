import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:towtruck_app/Screen/home_page/home_page.dart';
import 'package:towtruck_app/base/show_custom_snackbar.dart';
import 'package:towtruck_app/controllers/auth_controller.dart';
import 'package:towtruck_app/models/signup_body_model.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
     var emailController= TextEditingController();
    var firstNameController= TextEditingController();
    var passwordController= TextEditingController();
    var confirmpasswordController= TextEditingController();
    var lastNameController= TextEditingController();
    void registration(AuthController  authController){
      String email= emailController.text.trim();
      String firstName = firstNameController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = passwordController.text.trim();
      String lastName= lastNameController.text.trim();
      if(email.isEmpty){
        showCustomSnackbar('Type in your email address', title: 'Email');
      }
      else if(!GetUtils.isEmail(email)){
        showCustomSnackbar('Type in valid email address', title: 'Email');
      }
      else if(password.isEmpty){
        showCustomSnackbar('Type in your password', title: 'Password');
      }
      else if(confirmPassword.isEmpty){
        showCustomSnackbar('Type in your password', title: 'Password');
      }
      else if(password.length<6){
        showCustomSnackbar("Password can't be less than six characters", title: 'Password');
      }
       else if(confirmPassword.length<6){
        showCustomSnackbar("Password can't be less than six characters", title: 'Password');
      }
      else if(confirmPassword!=password){
        showCustomSnackbar("password doesn't match", title: 'Password');
      }
      else if(lastName.isEmpty){
        showCustomSnackbar('Type in your name', title: 'Name');
      }
      else if(firstName.isEmpty){
        showCustomSnackbar('Type in your phone', title: 'Phone');
      }
      else{
        SignUpBody signUpBody= SignUpBody(email: email, password: password, firstName: firstName, lastName: lastName, confirmPassword: confirmPassword, );
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            Get.to(HomePage());
          }
          else{
            showCustomSnackbar(status.message);
          }
        });
      }


    }
    return GetBuilder<AuthController>(builder: (authController) {
        return Material(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 80,),
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
                      child: SizedBox(
                        height: 45,
                        child: TextField(  
                          controller: emailController,
                          style: TextStyle(fontSize: 12),
                          cursorColor: Colors.grey, 
                          decoration: InputDecoration(  
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                            border: OutlineInputBorder(),  
                            labelText: 'Email',  
                            prefixIcon: Icon(Icons.email, color: Colors.amber,),
                             labelStyle: TextStyle(
                           color: Colors.grey,  ),
                          ),  
                        ),
                      ),  
                    ),
                        Padding(  
                      padding: EdgeInsets.only(left:30, right: 30, top: 30),  
                      child: SizedBox(
                        height: 45,
                        child: TextField(  
                          controller: passwordController,
                          obscureText: true,  
                          style: TextStyle(fontSize: 12),
                          cursorColor: Colors.grey, 
                          decoration: InputDecoration(  
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                            border: OutlineInputBorder(),  
                            labelText: 'Password',  
                            prefixIcon: Icon(Icons.lock, color: Colors.amber,),
                             labelStyle: TextStyle(
                           color: Colors.grey,  ),
                          ),  
                        ),
                      ),  
                    ),
                     Padding(  
                      padding: EdgeInsets.only(left:30, right: 30, top: 30),  
                      child: SizedBox(
                        height: 45,
                        child: TextField(  
                          controller: firstNameController,
                          style: TextStyle(fontSize: 12),
                          cursorColor: Colors.grey, 
                          decoration: InputDecoration(  
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                            border: OutlineInputBorder(),  
                            labelText: 'First Name',  
                            prefixIcon: Icon(Icons.person, color: Colors.amber,),
                             labelStyle: TextStyle(
                           color: Colors.grey,  ),
                          ),  
                        ),
                      ),  
                    ),
                     Padding(  
                      padding: EdgeInsets.only(left:30, right: 30, top: 30),  
                      child: SizedBox(
                        height: 45,
                        child: TextField(  
                          controller: lastNameController,
                          style: TextStyle(fontSize: 12),
                          cursorColor: Colors.grey, 
                          decoration: InputDecoration(  
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                            border: OutlineInputBorder(),  
                            labelText: 'Last Name',  
                            prefixIcon: Icon(Icons.person, color: Colors.amber,),
                             labelStyle: TextStyle(
                           color: Colors.grey,  ),
                          ),  
                        ),
                      ),  
                    ),
                    Padding(  
                      padding: EdgeInsets.only(left:30, right: 30, top: 30),  
                      child: SizedBox(
                        height: 45,
                        child: TextField(  
                          controller: confirmpasswordController,
                          style: TextStyle(fontSize: 12),
                          cursorColor: Colors.grey,
                          obscureText: true,  
                          decoration: InputDecoration(  
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                            border: OutlineInputBorder(),  
                            labelText: 'Confirm Password',  
                            prefixIcon: Icon(Icons.lock, color: Colors.amber,),
                             labelStyle: TextStyle(
                           color: Colors.grey,  ),
                          ),  
                        ),
                      ),  
                    ),
                 
                    ],
                   ),
                   SizedBox(height: 50,),
                   GestureDetector(
                    onTap: () {
                       registration(authController);
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
          ),
        );
      }
    );
  }
}