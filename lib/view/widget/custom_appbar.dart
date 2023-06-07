import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/utils/images.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Widget child;
  CustomAppBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: double.infinity,
    child: Column(children: [

      Container(width: double.infinity,height: 100,color: AppColors.greenColor,padding: const EdgeInsets.all(10),

      child: SafeArea(
        child: Row(children: [
          const CircleAvatar(radius: 27,
              child: CircleAvatar(radius: 25,backgroundImage: AssetImage(Images.avaterImage),)),

          const SizedBox(width: 5,),

          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: const [
            Spacer(),
            Text("Sajib Hasan",style: TextStyle(color: AppColors.defaultWhite,fontWeight: FontWeight.w600),),
            Text("developersajib@gmail.com",style: TextStyle(color: AppColors.defaultWhite,fontSize: 12),),
          ],
          )

        ],),
      ),),

      Expanded(child: child)

    ],),);
  }
}
