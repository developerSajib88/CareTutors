import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  Widget child;
  CustomAppBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthController authController = Provider.of<AuthController>(context);

    return SizedBox(width: double.infinity,height: double.infinity,
    child: Column(children: [

      Container(width: double.infinity,height: 100,color: AppColors.greenColor,padding: const EdgeInsets.all(10),

      child: SafeArea(
        child: Row(children: [
          const CircleAvatar(radius: 27,
              child: CircleAvatar(radius: 25,backgroundImage: AssetImage(Images.avaterImage),)),

          const SizedBox(width: 5,),

          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
            const Spacer(),
            Text(authController.userName,style: const TextStyle(color: AppColors.defaultWhite,fontWeight: FontWeight.w600),),
            Text(authController.userEmail,style: const TextStyle(color: AppColors.defaultWhite,fontSize: 12),),
          ],
          )

        ],),
      ),),

      Expanded(child: child)

    ],),);
  }
}
