import 'dart:async';

import 'package:caretutors/controller/onboarding_controller/onboarding_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:caretutors/view/screen/auth_screen/log_in_screen.dart';
import 'package:caretutors/view/screen/navigation_screen/bottom_navigation_screen.dart';
import 'package:caretutors/view/screen/others_screen/onboarding_screen.dart';
import 'package:caretutors/view/widget/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<OnboardingController>().updateUserPreviousView();
    /// Navigate main screen or Onboarding screen from splash screen
    Timer(const Duration(seconds: 4), () {
      if(context.read<OnboardingController>().userIsFirstTime){
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const OnboardingScreen()));
      }else{
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const LogInScreen()));
      }
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: Column(
          children: [
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: const [
              Text("Care",style: TextStyle(color: AppColors.greenColor,fontSize: 25,fontWeight: FontWeight.w800),),
              SizedBox(width: 2,),
              Text("Tutors",style: TextStyle(color: AppColors.blackColor,fontSize: 25,fontWeight: FontWeight.w800),),
            ],),

            const Spacer(),
            const SizedBox(width: 25, height: 25, child: CircularProgressIndicator(color: AppColors.greenColor,)),
            const SizedBox(height: 10,),
            const Text(AppConstants.appVersion,style: TextStyle(color: AppColors.blackColor),),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
