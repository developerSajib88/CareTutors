import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusCount extends StatefulWidget {
  const StatusCount({Key? key}) : super(key: key);

  @override
  State<StatusCount> createState() => _StatusCountState();
}

class _StatusCountState extends State<StatusCount> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context,controller,_) {
        return Row(
          children: [

            const SizedBox(width: 10),

            Expanded(
              child: Container(height: 50, alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.defaultWhite, borderRadius: BorderRadius.circular(3),
                ),

                child: Padding(padding: const EdgeInsets.only(top: 7,left: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(controller.newTaskList?.data.length.toString()??"0",style: GoogleFonts.poppins(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                      Text("New Task",style: GoogleFonts.poppins(fontSize: 10,color: AppColors.greyColor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),

              ),
            ),


            const SizedBox(width: 5,),


            Expanded(
              child: Container(height: 50, alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.defaultWhite, borderRadius: BorderRadius.circular(3),
                ),

                child: Padding(padding: const EdgeInsets.only(top: 7,left: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.completedTaskList?.data.length.toString()??"0",style: GoogleFonts.poppins(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                      Text("Completed",style: GoogleFonts.poppins(fontSize: 10,color: AppColors.greyColor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),

              ),
            ),

            const SizedBox(width: 5,),


            Expanded(
              child: Container(height: 50, alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.defaultWhite, borderRadius: BorderRadius.circular(3),
                ),

                child: Padding(padding: const EdgeInsets.only(top: 7,left: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(controller.cancelTaskList?.data.length.toString()??"0",style: GoogleFonts.poppins(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                      Text("Cancel",style: GoogleFonts.poppins(fontSize: 10,color: AppColors.greyColor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),

              ),
            ),

            const SizedBox(width: 5,),


            Expanded(
              child: Container(height: 50, alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.defaultWhite, borderRadius: BorderRadius.circular(3),
                ),

                child: Padding(padding: const EdgeInsets.only(top: 7,left: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(controller.progressTaskList?.data.length.toString()??"0",style: GoogleFonts.poppins(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                      Text("Progress",style: GoogleFonts.poppins(fontSize: 10,color: AppColors.greyColor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),

              ),
            ),

            const SizedBox(width: 10),



          ],
        );
      }
    );
  }
}
