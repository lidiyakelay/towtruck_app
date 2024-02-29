import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:towtruck_app/Screen/home_page/home_page.dart';
import 'package:towtruck_app/base/show_custom_snackbar.dart';
import 'package:towtruck_app/controllers/auth_controller.dart';
import 'package:towtruck_app/models/otp_body_model.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder:(authController) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 200,
                 decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/otp.PNG'))           ),
                ),
                SizedBox(height: 50,),
                Text(
                  'Enter 6-digit OTP',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                _buildOTPTextField(),
                SizedBox(height: 20),
                 GestureDetector(
                        onTap: () {
                          _verifyOTP(authController);
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
                              child: Text('Verify',style:
                                           TextStyle(
                                            color: Color.fromARGB(255, 244, 241, 241),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            decoration: TextDecoration.none
                                           ), )
                            ),
                          ),
                       ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildOTPTextField() {
    return SizedBox(
      height: 60,
      width: 200,
      child: TextField(
        controller: _otpController,
        keyboardType: TextInputType.number,
        maxLength: 6,
         decoration: InputDecoration(  
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(width: 1, color: Colors.grey), ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(width: 1, color: Colors.grey), ),
                              border: OutlineInputBorder(),  
                              labelText: 'Enter OTP',  
                              prefixIcon: Icon(Icons.lock, color: Colors.amber,),
                               labelStyle: TextStyle(
                             color: Colors.grey,  ),
                            ),
      ),
  );
  }

  void _verifyOTP(AuthController authController) {
    String otp = _otpController.text.trim();
     if(otp.isEmpty){
        showCustomSnackbar('please input OTP code', title: 'OTP');
      }
     else{
      print("1111111111111111111");
        OTP otpBody = OTP(otp: otp);
        authController.OTPVerfication(otpBody).then((status){
          if(status.isSuccess){
            Get.to(HomePage());
          }
          else{
            showCustomSnackbar(status.message);
          }
        });
      }

    print('Entered OTP: $otp');
  }
}