import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widget/task_item_view.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TaskController>().getCompletedTaskList(context.read<AuthController>().userToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: double.infinity,
      child: Consumer<TaskController>(
        builder: (context, controller,_) {
          return RefreshIndicator(
            onRefresh: ()=> controller.getCompletedTaskList(Provider.of<AuthController>(context,listen: false).userToken),
            color: AppColors.greenColor,
            child: Visibility(
              visible: controller.completedTaskList != null,
              replacement: const Center(child: CircularProgressIndicator(color: AppColors.greenColor,),),
              child: Visibility(
                visible: controller.completedTaskList!.data.isNotEmpty,
                replacement: const Center(child: Text("Empty",style: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),)),
                child: ListView.builder(
                  itemCount: controller.completedTaskList?.data.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context,index){
                      return TaskItemView(
                        statusColor: AppColors.greenColor,
                        statusName: "Completed",
                        title: controller.completedTaskList?.data[index].title??"",
                        description: controller.completedTaskList?.data[index].description??"",
                        publishDate: controller.completedTaskList?.data[index].createdDate??"",
                        getId: controller.completedTaskList?.data[index].id??"",
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
