import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widget/task_item_view.dart';

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
    return SizedBox(width: double.infinity,height: double.infinity,
      child: Consumer<TaskController>(
          builder: (context, controller,_) {
            return RefreshIndicator(
              onRefresh: ()=> controller.getNewTaskList(Provider.of<AuthController>(context).userToken),
              color: AppColors.greenColor,
              child: Visibility(
                visible: controller.newTaskList != null,
                replacement: const Center(child: CircularProgressIndicator(color: AppColors.greenColor,),),
                child: Visibility(
                  visible: controller.newTaskList!.data.isNotEmpty,
                  replacement: const Center(child: Text("Empty",style: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),)),
                  child: ListView.builder(
                      itemCount: controller.newTaskList?.data.length,
                      itemBuilder: (context,index){
                        return TaskItemView(
                          statusColor: AppColors.blueColor,
                          statusName: "Completed",
                          title: controller.newTaskList?.data[index].title??"",
                          description: controller.newTaskList?.data[index].description??"",
                          publishDate: controller.newTaskList?.data[index].createdDate??"",
                          getId: controller.newTaskList?.data[index].id??"",
                        );
                      }
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
