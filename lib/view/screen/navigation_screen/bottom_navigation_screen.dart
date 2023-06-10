import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/controller/navigation_controller/navigation_controller.dart';
import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:caretutors/view/screen/navigation_screen/cancel_task_screen.dart';
import 'package:caretutors/view/screen/navigation_screen/completed_task_screen.dart';
import 'package:caretutors/view/screen/navigation_screen/news_task_screen.dart';
import 'package:caretutors/view/screen/navigation_screen/progress_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/images.dart';
import '../../widget/custom_appbar.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  List<Widget> navigationScreen = [const NewTaskScreen(),const CompletedTaskScreen(),const CancelTaskScreen(),const ProgressTaskScreen()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// This function for fetching data from server
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TaskController>().getNewTaskList(context.read<AuthController>().userToken);
      context.read<TaskController>().getCompletedTaskList(context.read<AuthController>().userToken);
      context.read<TaskController>().getCancelTaskList(context.read<AuthController>().userToken);
      context.read<TaskController>().getProgressTaskList(context.read<AuthController>().userToken);
    });

  }

  @override
  Widget build(BuildContext context) {

    BottomNavigationController bottomNavigationController = Provider.of<BottomNavigationController>(context);

    return Scaffold(
      body: CustomAppBar(
        child: navigationScreen[bottomNavigationController.navigationIndex],
      ),


      bottomNavigationBar: Container(width: double.infinity,height: 60,
        decoration: const BoxDecoration(boxShadow: [
              BoxShadow(color: AppColors.defaultGrey, spreadRadius: 0.2, blurRadius: 5)
            ]
        ),

        child: Consumer<BottomNavigationController>(
          builder: (context, controller,_) {
            return Row(
              children: [

                //=======================================>>>>>New Task Navigation Button Here
                Expanded(
                  child: InkWell(
                    onTap: ()=> controller.changeIndex(0),
                    child: Container(color: controller.navigationIndex == 0 ? AppColors.greenColor : AppColors.defaultWhite,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(Images.documentIcon, width: 30, height: 30,
                              color: controller.navigationIndex==0 ? AppColors.defaultWhite : AppColors.blackColor,
                            ),
                          ),

                          Text(AppConstants.NEW_TASK, style: GoogleFonts.poppins(
                              textStyle:  TextStyle(fontSize: 10, fontWeight: FontWeight.bold,
                                    color: controller.navigationIndex == 0 ? AppColors.defaultWhite : AppColors.blackColor)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),


                //=======================================>>>>>Completed Task Navigation Button Here
                Expanded(
                  child: InkWell(
                    onTap: ()=> controller.changeIndex(1),
                    child: Container(color: controller.navigationIndex == 1 ? AppColors.greenColor : AppColors.defaultWhite,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(Images.documentIcon, width: 30, height: 30,
                              color: controller.navigationIndex == 1 ? AppColors.defaultWhite : AppColors.blackColor,
                            ),
                          ),

                          Text(AppConstants.COMPLETED, style: GoogleFonts.poppins(
                              textStyle:  TextStyle(fontSize: 10, fontWeight: FontWeight.bold,
                                  color: controller.navigationIndex == 1 ? AppColors.defaultWhite : AppColors.blackColor)
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),


                //=======================================>>>>>Canceled Task Navigation Button Here
                Expanded(
                  child: InkWell(
                    onTap: ()=> controller.changeIndex(2),
                    child: Container(color: controller.navigationIndex == 2 ? AppColors.greenColor : AppColors.defaultWhite,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(Images.documentIcon, width: 30, height: 30,
                              color: controller.navigationIndex == 2 ? AppColors.defaultWhite : AppColors.blackColor,
                            ),
                          ),

                          Text(AppConstants.CANCELED, style: GoogleFonts.poppins(
                              textStyle:  TextStyle(fontSize: 10, fontWeight: FontWeight.bold,
                                  color: controller.navigationIndex == 2 ? AppColors.defaultWhite : AppColors.blackColor)
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),


                //=======================================>>>>>Progress Task Navigation Button Here
                Expanded(
                  child: InkWell(
                    onTap: ()=> controller.changeIndex(3),
                    child: Container(color: controller.navigationIndex == 3 ? AppColors.greenColor : AppColors.defaultWhite,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(Images.documentIcon, width: 30, height: 30,
                              color: controller.navigationIndex == 3 ? AppColors.defaultWhite : AppColors.blackColor,
                            ),
                          ),

                          Text(AppConstants.PROGRESS, style: GoogleFonts.poppins(
                              textStyle:  TextStyle(fontSize: 10, fontWeight: FontWeight.bold,
                                  color: controller.navigationIndex == 3 ? AppColors.defaultWhite : AppColors.blackColor)
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            );
          }
        ),

      ),


    );

  }
}
