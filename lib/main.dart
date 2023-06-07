import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/controller/navigation_controller/navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/app_theme.dart';
import 'view/screen/others_screen/splash_screen.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> AuthController()),
    ChangeNotifierProvider(create: (context)=> BottomNavigationController()),
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
      home: const SplashScreen(),
    );
  }
}
