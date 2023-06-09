import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'custom_button.dart';

dynamic bottomSheet(BuildContext context,String title,description,getId){
  String taskStack = "New";
  ValueNotifier<bool> loading = ValueNotifier(false);

  TaskController taskController = Provider.of<TaskController>(context,listen: false);
  AuthController authController = Provider.of<AuthController>(context,listen: false);

  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
            builder: (context,setState){
              return Padding(padding: const EdgeInsets.all(20), child: SizedBox(
                width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [


                      Text(title, style: GoogleFonts.poppins(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.w600),),

                      Text(description, maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(fontSize: 15, color: AppColors.greyColor, fontWeight: FontWeight.normal),
                      ),


                      RadioListTile(
                          value: "New",
                          groupValue: taskStack,
                          title: Text("New Task",style: GoogleFonts.poppins(color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                          onChanged: (value){
                            taskStack = value.toString();
                            setState((){});
                            print(value.toString());
                          }
                      ),



                      RadioListTile(
                          value: "Completed",
                          groupValue: taskStack,
                          title: Text("Completed Task",style: GoogleFonts.poppins(color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                          onChanged: (value){
                            taskStack = value.toString();
                            setState((){});
                            print(value.toString());
                          }
                      ),




                      RadioListTile(
                          value: "Progress",
                          groupValue: taskStack,
                          title: Text("Progress Task",style: GoogleFonts.poppins(color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                          onChanged: (value){
                            taskStack = value.toString();
                            setState((){});
                            print(value.toString());
                          }
                      ),


                      RadioListTile(
                          value: "Cancel",
                          groupValue: taskStack,
                          title: Text("Cancel Task",style: GoogleFonts.poppins(color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                          onChanged: (value){
                            taskStack = value.toString();
                            setState((){});
                            print(value.toString());
                          }
                      ),


                      Expanded(child: Container()),


                      SizedBox(
                        width: double.infinity,
                        height: 40.0,
                        child: CustomButton(
                          onPressed: ()async{
                            loading.value = true;
                            switch(taskStack){
                              case "New":
                                {
                                  bool result = await taskController.updateTask(authController.userToken, getId, taskStack);
                                  if(result){
                                    loading.value = false;
                                    Navigator.pop(context);
                                  };
                                }
                                break;
                              case "Completed":
                                {
                                  bool result = await taskController.updateTask(authController.userToken, getId, taskStack);
                                  if(result){
                                    loading.value = false;
                                    Navigator.pop(context);
                                  }
                                }
                                break;

                              case "Progress":
                                {
                                  bool result = await taskController.updateTask(authController.userToken, getId, taskStack);
                                  if(result){
                                    loading.value = false;
                                    Navigator.pop(context);
                                  }
                                }
                                break;

                              case "Cancel":
                                {
                                  bool result = await taskController.updateTask(authController.userToken,getId, taskStack);
                                  if(result){
                                    loading.value = false;
                                    Navigator.pop(context);
                                  }
                                }
                                break;
                            }

                            taskController.getNewTaskList(Provider.of<AuthController>(context, listen: false).userToken);
                            taskController.getCompletedTaskList(Provider.of<AuthController>(context, listen: false).userToken);
                            taskController.getProgressTaskList(Provider.of<AuthController>(context, listen: false).userToken);
                            taskController.getCancelTaskList(Provider.of<AuthController>(context, listen: false).userToken);
                            },

                          child: ValueListenableBuilder(
                            valueListenable: loading,
                            builder: (context,value,_) {
                              return Visibility(
                                  visible: loading.value == false,
                                  child: Text("Update Task",style: TextStyle(color: AppColors.defaultWhite),),
                                  replacement: const SizedBox(width: 20,height: 20,
                                  child: CircularProgressIndicator(color: AppColors.defaultWhite,)
                                  ),
                              );
                            }
                          )
                        ),
                      )

                    ],
                  ),
                ),
              );
            }
        );
      }
  );
}