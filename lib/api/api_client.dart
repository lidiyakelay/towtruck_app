import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:towtruck_app/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late SharedPreferences sharedPreferences;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}){
  //baseUrl=appBaseUrl;
    timeout= Duration(seconds: 30);
    token=sharedPreferences.getString(AppConstants.Token)??"";
    _mainHeaders={
      
      'Authorization': 'Bearer $token'
    };
  }
 
  updateHeader(String token){
    _mainHeaders={
      
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri,{ Map<String, String>? headers}) async{
    try{
      print(token);
      print(uri);
     Response response= await get(uri, headers:headers??_mainHeaders) ;
     return response;
    }
    catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> postData(String uri, dynamic data)async{
    try{
      Response response = await post(uri, data, );
      print(uri);
      print(response.body);
      print(response.statusCode);
      return response;
    }
    catch(e){
      return Response(statusCode: 1,statusText:e.toString());
    }
  }
   Future<Response> publishData(String uri, dynamic data, { Map<String, String>? headers} )async{
    try{
      Response response = await post(uri, data,headers:headers??_mainHeaders );
      print(uri);
      print(response.body);
      print(response.statusCode);
      return response;
    }
    catch(e){
      return Response(statusCode: 1,statusText:e.toString());
    }
  }
}