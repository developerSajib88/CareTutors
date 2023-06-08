import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../widget/task_item_view.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: double.infinity,
      child: ListView.builder(
          itemBuilder: (context,index){
            return TaskItemView(
              statusColor: AppColors.greenColor,
              statusName: "Completed",
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
