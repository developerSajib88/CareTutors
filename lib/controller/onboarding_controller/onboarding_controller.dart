import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class OnboardingController extends ChangeNotifier{
  bool userIsFirstTime = true;

  /// This function is calling for user view onboarding screen
  void checkingUser()async{
    Box box = await Hive.openBox("intro");
    box.put("userFirst", userIsFirstTime);
  }

  /// This function is calling for user previous view onboarding screen or no
  void updateUserPreviousView()async{
    Box box = await Hive.openBox("intro");
    userIsFirstTime = box.get("userFirst");
    notifyListeners();
  }

}