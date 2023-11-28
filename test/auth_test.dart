
import 'dart:convert';

import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';


class MockHTTPClient extends Mock implements Client{}

void main(){
  late MockHTTPClient mockHTTPClient; 
  late AuthController authController;

  setUp((){
    mockHTTPClient = MockHTTPClient();
    authController = AuthController(client: mockHTTPClient);
  });

  
  group("User Log In =>", () {

   test("User Log In Success=> ", ()async{

   when(() => mockHTTPClient.post(
    Uri.parse(AppConstants.LOGIN_ACCOUNT),
    headers: AppConstants.REQUEST_HEADER,
    body: jsonEncode(
        {
          "email": "hasansajib4142@gmail.com",
          "password": "123dfas456"
        }
    )
   ),
   ).thenAnswer((invocation)async{
    return Response(
      jsonEncode(
        {"status":"success","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDEyMzQ3NDgsImRhdGEiOiJoYXNhbnNhamliNDE0MkBnbWFpbC5jb20iLCJpYXQiOjE3MDExNDgzNDh9.t52Uwpr6preUvhliIPcy98Fj2pb3SGMTolhLUWWZLyQ","data":{"email":"hasansajib4142@gmail.com","firstName":"Sajib","lastName":"Hasan","mobile":"01909834142","photo":""}}
      )
      , 200);
   }
   );

   bool value = await authController.userLogIn("hasansajib4142@gmail.com","123dfas456");

   expect(value, true);

   });
 

  test("User Log In UnAuthorized => ", ()async{
   
   when(() => mockHTTPClient.post(
    Uri.parse(AppConstants.LOGIN_ACCOUNT),
    headers: AppConstants.REQUEST_HEADER,
    body: jsonEncode(
        {
          "email": "hasansajib4142@gmail.com",
          "password": "123dfas456"
        }
    )
   ),
   ).thenAnswer((invocation)async{
    return Response(
      jsonEncode(
        {"status":"unauthorized"}
      ), 401);
   }
   );

   bool value = await authController.userLogIn("hasansajib4142@gmail.com","123dfas456");

   expect(value, false);

  });

  tearDown(() => print("Log In test is done!"));

  });

}