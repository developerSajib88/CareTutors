import 'package:flutter/material.dart';

class BottomNavigationController extends ChangeNotifier{

 int navigationIndex = 0;

 /// Bottom navigation index changing function
 void changeIndex(int index){
  navigationIndex = index;
  notifyListeners();
 }


}