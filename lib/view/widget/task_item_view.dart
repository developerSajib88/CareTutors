
import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/view/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../utils/font_styles.dart';

class TaskItemView extends StatefulWidget {
  Color statusColor;
  String statusName;
  String title;
  String description;
  String publishDate;
  String getId;
  TaskItemView({
    Key? key,
    required this.statusColor,
    required this.statusName,
    required this.title,
    required this.description,
    required this.publishDate,
    required this.getId,
  }) : super(key: key);

  @override
  State<TaskItemView> createState() => _TaskItemViewState();
}

class _TaskItemViewState extends State<TaskItemView> {

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    TaskController taskController = Provider.of<TaskController>(context);

    return Padding(padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
      child: Container(width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: AppColors.defaultWhite,),
        child: Padding(padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //========================================================>>>>>Task item Title here
              Text(widget.title, style: FontStyles.titleTextStyle),

              //========================================================>>>>>Task item Description here
              Text(widget.description, maxLines: 2, overflow: TextOverflow.ellipsis, style:FontStyles.descriptionTextStyle),

              //========================================================>>>>>Task item date here
              Text(widget.publishDate, style: FontStyles.dateTextStyle),

              const SizedBox(height: 5.0,),

              Row(
                children: [

                  Container(height: 17, alignment: Alignment.center,
                    decoration: BoxDecoration(color: widget.statusColor, borderRadius: BorderRadius.circular(8),),
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(widget.statusName, style: FontStyles.statusTextStyle,),
                    ),
                  ),

                ],
              ),

              Row(
                children: [

                  const Spacer(),

                  //=================================================>>>>>Task item edit button here
                  SizedBox(width: 15, height: 15,
                    child: InkWell(
                        onTap: ()=> bottomSheet(context, widget.title, widget.description, widget.getId),
                        child: const Icon(Icons.text_snippet_outlined,color: AppColors.greenColor,size: 15,)
                    ),
                  ),

                  const SizedBox(width: 5,),


                  //========================================================>>>>>Task item Delete here
                  SizedBox(width: 15, height: 15,
                    child: InkWell(
                        onTap: () {
                          Provider.of<TaskController>(context, listen: false).deleteTask(
                              widget.getId,
                              Provider.of<AuthController>(context, listen: false).userToken);

                          taskController.getNewTaskList(Provider.of<AuthController>(context, listen: false).userToken);
                          taskController.getCompletedTaskList(Provider.of<AuthController>(context, listen: false).userToken);
                          taskController.getCancelTaskList(Provider.of<AuthController>(context, listen: false).userToken);
                          taskController.getProgressTaskList(Provider.of<AuthController>(context, listen: false).userToken);

                        },
                        child: const Icon(Icons.delete_forever_outlined,color: AppColors.redColor,size: 15,)
                    ),
                  ),
                ],
              )

            ],
          ),
        ),

      ),
    );
  }
}
