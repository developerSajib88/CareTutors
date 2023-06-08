import 'dart:convert';

import 'package:caretutors/model/task_model/cancel_task_model.dart';
import 'package:caretutors/model/task_model/completed_task_model.dart';
import 'package:caretutors/model/task_model/new_task_model.dart';
import 'package:caretutors/model/task_model/progress_task_model.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TaskController extends ChangeNotifier{

  NewTaskList? newTaskList;
  CompletedTaskList? completedTaskList;
  ProgressTaskList? progressTaskList;
  CancelTaskList? cancelTaskList;

  /// This function is called for getting New task list
  Future getNewTaskList(String token)async{
    http.Response response = await http.get(Uri.parse(AppConstants.NEW_TASK_URI),
    headers:  {
        'Content-Type': 'application/json',
        'token' : token
        }
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["status"] == "success"){
      newTaskList = newTaskListFromJson(response.body);
      notifyListeners();
    }
    
  }


  /// This function is called for getting Completed task list
  Future getCompletedTaskList(String token)async{
    http.Response response = await http.get(Uri.parse(AppConstants.COMPLETD_TASK_URI),
        headers:  {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token' : token
        }
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["status"] == "success"){
      completedTaskList = completedTaskListFromJson(response.body);
      notifyListeners();
    }

  }




  /// This function is called for getting cancel task list
  Future getCancelTaskList(String token)async{
    http.Response response = await http.get(Uri.parse(AppConstants.CANCEL_TASK_URI),
        headers:  {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token' : token
        }
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["status"] == "success"){
      cancelTaskList = cancelTaskListFromJson(response.body);
      notifyListeners();
    }

  }



  /// This function is called for getting progress task list
  Future getProgressTaskList(String token)async{
    http.Response response = await http.get(Uri.parse(AppConstants.PROGRESS_TASK_URI),
        headers:  {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token' : token
        }
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["status"] == "success"){
      progressTaskList = progressTaskListFromJson(response.body);
      notifyListeners();
    }

  }





}