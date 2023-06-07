import 'package:caretutors/utils/images.dart';
import 'package:flutter/cupertino.dart';

class BackgroundScreen extends StatelessWidget {
  Widget child;
  BackgroundScreen({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(Images.bgImage,width: double.infinity,height: double.infinity, fit: BoxFit.cover,),
      SizedBox(width: double.infinity,height: double.infinity,child: child,)

    ],);
  }
}
