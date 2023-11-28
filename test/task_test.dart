import 'dart:convert';

import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:caretutors/model/task_model/new_task_model.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';

class MockHTTPClient extends Mock implements Client{}

void main(){
 late TaskController taskController;
 late MockHTTPClient mockHTTPClient;

 setUp((){
  mockHTTPClient = MockHTTPClient();
  taskController = TaskController(client: mockHTTPClient);
 });


 group("Task List =>", () {

  test("New Task List Success =>", ()async{
   
   when(() => mockHTTPClient.get(
    Uri.parse(AppConstants.NEW_TASK_URI),
    headers:  {
        'Content-Type': 'application/json',
        'token' : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDEyMzQ3NDgsImRhdGEiOiJoYXNhbnNhamliNDE0MkBnbWFpbC5jb20iLCJpYXQiOjE3MDExNDgzNDh9.t52Uwpr6preUvhliIPcy98Fj2pb3SGMTolhLUWWZLyQ"
        },
    )
   ).thenAnswer((invocation)async{
      return Response(
        jsonEncode({"status":"success","data":[{"_id":"656586214c7eac36557b68b7","title":"asdfasd","description":"asdfasdfasdf","status":"New","createdDate":"26-11-2023"},{"_id":"6565862a4c7eac36557b68be","title":"asdfasdfas","description":"adsfasdfasdfeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDEyMzQ3NDgsImRhdGEiOiJoYXNhbnNhamliNDE0MkBnbWFpbC5jb20iLCJpYXQiOjE3MDExNDgzNDh9.t52Uwpr6preUvhliIPcy98Fj2pb3SGMTolhLUWWZLyQ","status":"New","createdDate":"26-11-2023"}]})
      ,200);
   });


   taskController.getNewTaskList("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDEyMzQ3NDgsImRhdGEiOiJoYXNhbnNhamliNDE0MkBnbWFpbC5jb20iLCJpYXQiOjE3MDExNDgzNDh9.t52Uwpr6preUvhliIPcy98Fj2pb3SGMTolhLUWWZLyQ").then((value){
    expect(taskController.newTaskList, isA<NewTaskList>());
   });



  });


  test("New Task List Not Found =>", ()async{
   
   when(() => mockHTTPClient.get(
    Uri.parse(AppConstants.NEW_TASK_URI),
    headers:  {
        'Content-Type': 'application/json',
        'token' : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDEyMzQ3NDgsImRhdGEiOiJoYXNhbnNhamliNDE0MkBnbWFpbC5jb20iLCJpYXQiOjE3MDExNDgzNDh9.t52Uwpr6preUvhliIPcy98Fj2pb3SGMTolhLUWWZLyQ"
        },
    )
   ).thenAnswer((invocation)async{
      return Response(
        jsonEncode({"status":"failed","data":[{"_id":"656586214c7eac36557b68b7","title":"asdfasd","description":"asdfasdfasdf","status":"New","createdDate":"26-11-2023"},{"_id":"6565862a4c7eac36557b68be","title":"asdfasdfas","description":"adsfasdfasdfeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDEyMzQ3NDgsImRhdGEiOiJoYXNhbnNhamliNDE0MkBnbWFpbC5jb20iLCJpYXQiOjE3MDExNDgzNDh9.t52Uwpr6preUvhliIPcy98Fj2pb3SGMTolhLUWWZLyQ","status":"New","createdDate":"26-11-2023"}]})
      ,404);
   });


    taskController.getNewTaskList("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDEyMzQ3NDgsImRhdGEiOiJoYXNhbnNhamliNDE0MkBnbWFpbC5jb20iLCJpYXQiOjE3MDExNDgzNDh9.t52Uwpr6preUvhliIPcy98Fj2pb3SGMTolhLUWWZLyQ").then((value){
    expect(taskController.newTaskList, isA<NewTaskList>());
   });

  });

  
 });
 
   tearDownAll(() => print("Task List test is done"));


}