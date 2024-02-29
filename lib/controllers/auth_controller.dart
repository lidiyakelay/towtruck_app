
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:towtruck_app/models/otp_body_model.dart';
import 'package:towtruck_app/models/signup_body_model.dart';
import 'package:towtruck_app/repository/auth_repo.dart';
import 'package:towtruck_app/utils/app_constants.dart';

import '../models/response_model.dart';
import '../models/signin_body_model.dart';

class AuthController extends GetxController implements GetxService{
  AuthRepo authRepo;
 AuthController({required this.authRepo});
 bool _isLoading = false;
 bool get isLoading => _isLoading;
 Future<ResponseModel>registration(SignUpBody signUpBody) async {
     _isLoading=true;
     update();
     Response response =  await authRepo.registration(signUpBody);
     late ResponseModel responseModel;
     if(response.statusCode==201){
      print('success');
       print('success'+response.body['token']);
      //authRepo.saveToken(response.body['token']);
      responseModel=ResponseModel(true, 'sucess');
     }
    else{
      print('fail');
      responseModel=ResponseModel(false, response.body[0][0]!);
     }
    _isLoading=false;
    update();
    return responseModel;
}
 Future<ResponseModel>OTPVerfication(OTP otp) async {
     _isLoading=true;
     update();
     Response response =  await authRepo.otp(otp);
     late ResponseModel responseModel;
     if(response.statusCode==200){
      print("2222222222222222");
      responseModel=ResponseModel(true, 'sucess');
     }
    else{
      print('333333333333333');
      responseModel=ResponseModel(false, "something went wrong try again");
     }
    _isLoading=false;
    update();
    return responseModel;
}
 Future<ResponseModel>login(SignInBody signInBody) async {
   _isLoading=true;
   update();
   Response response =  await authRepo.login(signInBody);
   late ResponseModel responseModel;
   if(response.statusCode==200){
     print('got here');
     authRepo.saveToken(response.body["access_token"]);
     responseModel=ResponseModel(true, 'success');
   }
   else{
     print('got here 2');
     responseModel=ResponseModel(false, response.statusText!);
   }
   _isLoading=false;
   update();
   return responseModel;
 }

 saveUserCredentials(SignInBody signInBody){
   authRepo.saveUserCredentials(signInBody);
 }
 bool userLoggedIn(){
   return authRepo.userLoggedIn();
 }
 bool clearSharedData(){
   update();
   return authRepo.clearSharedData();
 }

}