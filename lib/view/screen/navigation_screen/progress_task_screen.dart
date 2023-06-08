import 'package:caretutors/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widget/task_item_view.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: double.infinity,
    child: ListView.builder(
        itemBuilder: (context,index){
          return TaskItemView(
            statusColor: AppColors.blueColor,
            statusName: "new",
            title: '',
            description: '',
            publishDate: '',
            getId: '',
          );
        }
    ),
    );
  }
}
