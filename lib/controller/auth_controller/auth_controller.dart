import 'dart:convert';

import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class AuthController extends ChangeNotifier{
  final http.Client client;
  AuthController({required this.client});
  
  String userToken = "";
  String userName = "";
  String userEmail = "";
  
  
  /// Create account function
  Future<bool> accountCreate(String email,firstName,lastName,mobile,password)async{
    http.Response response = await http.post(Uri.parse(AppConstants.CREATE_ACCOUNT),
    headers: AppConstants.REQUEST_HEADER,
    body: jsonEncode({
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
      "photo":""
    }));

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["status"] == "success"){
      Toast.show("Success", duration: Toast.lengthShort, gravity:  Toast.bottom,backgroundColor: AppColors.blackColor);
      return true;
    }else{
      Toast.show("Failed! Try again", duration: Toast.lengthShort, gravity:  Toast.bottom,backgroundColor: AppColors.blackColor);
      return false;
    }
    
  }
  
  
  
  /// Log in function
  Future<bool> userLogIn(String email,password)async{
    http.Response response = await client.post(Uri.parse(AppConstants.LOGIN_ACCOUNT),
    headers: AppConstants.REQUEST_HEADER,
    body: jsonEncode(
        {
          "email": email,
          "password": password
        }
    ));

    print(">>>>>>>>>>>>>${response.body}");

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["status"] == "success"){
      userToken = getMap["token"]??"";
      userEmail = getMap["data"]["email"]??"";
      userName = getMap["data"]["firstName"]+" "+getMap["data"]["lastName"];

      notifyListeners();
      //Toast.show("Success", duration: Toast.lengthShort, gravity:  Toast.bottom,backgroundColor: AppColors.blackColor);
      return true;
    }else{
      //Toast.show(getMap["status"], duration: Toast.lengthShort, gravity:  Toast.bottom,backgroundColor: AppColors.blackColor);
      return false;
    }
  }
  

}