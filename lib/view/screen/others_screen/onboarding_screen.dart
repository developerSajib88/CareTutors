import 'package:caretutors/controller/onboarding_controller/onboarding_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:caretutors/view/screen/navigation_screen/bottom_navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'package:provider/provider.dart';

import '../../../utils/images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(width: double.infinity, height: double.infinity,
          child: Consumer<OnboardingController>(
            builder: (context,controller,_) {
              return OnBoardingScreen(
                onSkip: (){
                  controller.userIsFirstTime = false;
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> const BottomNavigationScreen()));
                  controller.checkingUser();
                },
                showPrevNextButton: true,
                showIndicator: true,
                backgourndColor: AppColors.defaultWhite,
                activeDotColor: AppColors.greenColor,
                deactiveDotColor: AppColors.defaultGrey,
                iconColor: AppColors.greenColor,
                leftIcon: Icons.arrow_circle_left_rounded,
                rightIcon: Icons.arrow_circle_right_rounded,
                iconSize: 30,
                pages: [
                  OnBoardingModel(
                    image: Image.asset(Images.introImage),
                    title: AppConstants.LOREM_TEXT,
                    titleColor: AppColors.blackColor,
                    body: AppConstants.DUMMY_TEXT,
                  ),

                  OnBoardingModel(
                    image: Image.asset(Images.introImage),
                    title: AppConstants.LOREM_TEXT,
                    titleColor: AppColors.blackColor,
                    body: AppConstants.DUMMY_TEXT,
                  ),


                  OnBoardingModel(
                    image: Image.asset(Images.introImage),
                    title: AppConstants.LOREM_TEXT,
                    titleColor: AppColors.blackColor,
                    body: AppConstants.DUMMY_TEXT,
                  ),



                ],
      );
            }
          ),
    ));
  }
}
