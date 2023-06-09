import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:caretutors/view/widget/status_count_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widget/task_item_view.dart';
import '../others_screen/create_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TaskController>().getNewTaskList(context.read<AuthController>().userToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(width: double.infinity,height: double.infinity,
        child: Consumer<TaskController>(
            builder: (context, controller,_) {
              return RefreshIndicator(
                onRefresh: ()=> controller.getNewTaskList(Provider.of<AuthController>(context,listen: false).userToken),
                color: AppColors.greenColor,
                child: Column(
                  children: [

                    const SizedBox(height: 10,),

                    const StatusCount(),


                    Expanded(
                      child: Visibility(
                        visible: controller.newTaskList != null,
                        replacement: const Center(child: CircularProgressIndicator(color: AppColors.greenColor,),),
                        child: Visibility(
                          visible: controller.newTaskList!.data.isNotEmpty,
                          replacement: const Center(child: Text("Empty",style: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),)),
                          child: ListView.builder(
                              itemCount: controller.newTaskList?.data.length,
                              padding: const EdgeInsets.only(top: 10),
                              itemBuilder: (context,index){
                                return TaskItemView(
                                  statusColor: AppColors.blueColor,
                                  statusName: "New",
                                  title: controller.newTaskList?.data[index].title??"",
                                  description: controller.newTaskList?.data[index].description??"",
                                  publishDate: controller.newTaskList?.data[index].createdDate??"",
                                  getId: controller.newTaskList?.data[index].id??"",
                                );
                              }
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder: (context)=> const CreateTaskScreen())),
        backgroundColor: AppColors.greenColor,
        child: const Icon(Icons.add,color: AppColors.defaultWhite,),
      ),

    );

  }
}
