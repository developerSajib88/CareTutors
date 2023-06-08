import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widget/task_item_view.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TaskController>().getProgressTaskList(context.read<AuthController>().userToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: double.infinity,
      child: Consumer<TaskController>(
          builder: (context, controller,_) {
            return RefreshIndicator(
              onRefresh: ()=> controller.getProgressTaskList(Provider.of<AuthController>(context,listen: false).userToken),
              color: AppColors.greenColor,
              child: Visibility(
                visible: controller.progressTaskList != null,
                replacement: const Center(child: CircularProgressIndicator(color: AppColors.greenColor,),),
                child: Visibility(
                  visible: controller.progressTaskList!.data.isNotEmpty,
                  replacement: const Center(child: Text("Empty",style: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),)),
                  child: ListView.builder(
                      itemCount: controller.progressTaskList?.data.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context,index){
                        return TaskItemView(
                          statusColor: AppColors.pinkColor,
                          statusName: "Progress",
                          title: controller.progressTaskList?.data[index].title??"",
                          description: controller.progressTaskList?.data[index].description??"",
                          publishDate: controller.progressTaskList?.data[index].createdDate??"",
                          getId: controller.progressTaskList?.data[index].id??"",
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
