import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../widget/task_item_view.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: double.infinity,
      child: ListView.builder(
          itemBuilder: (context,index){
            return TaskItemView(
              statusColor: AppColors.redColor,
              statusName: "Canceled",
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
