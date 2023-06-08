import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widget/task_item_view.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TaskController>().getCancelTaskList(context.read<AuthController>().userToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: double.infinity,
      child: Consumer<TaskController>(
          builder: (context, controller,_) {
            return RefreshIndicator(
              onRefresh: ()=> controller.getCancelTaskList(Provider.of<AuthController>(context).userToken),
              color: AppColors.greenColor,
              child: Visibility(
                visible: controller.cancelTaskList != null,
                replacement: const Center(child: CircularProgressIndicator(color: AppColors.greenColor,),),
                child: Visibility(
                  visible: controller.cancelTaskList!.data.isNotEmpty,
                  replacement: const Center(child: Text("Empty",style: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),)),
                  child: ListView.builder(
                      itemCount: controller.cancelTaskList?.data.length,
                      itemBuilder: (context,index){
                        return TaskItemView(
                          statusColor: AppColors.redColor,
                          statusName: "Cancel",
                          title: controller.cancelTaskList?.data[index].title??"",
                          description: controller.cancelTaskList?.data[index].description??"",
                          publishDate: controller.cancelTaskList?.data[index].createdDate??"",
                          getId: controller.cancelTaskList?.data[index].id??"",
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
