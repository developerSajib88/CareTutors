import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/controller/navigation_controller/navigation_controller.dart';
import 'package:caretutors/controller/onboarding_controller/onboarding_controller.dart';
import 'package:caretutors/view/screen/auth_screen/log_in_screen.dart';
import 'package:caretutors/view/screen/auth_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'controller/task_controller/task_controller.dart';
import 'theme/app_theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> AuthController()),
    ChangeNotifierProvider(create: (context)=> BottomNavigationController()),
    ChangeNotifierProvider(create: (context)=> OnboardingController()),
    ChangeNotifierProvider(create: (context)=> TaskController()),
  ],
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const LogInScreen(),
    );
  }
}
