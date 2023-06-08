import 'package:caretutors/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onPressed;
  Widget child;
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.greenColor),
        child: child,
      ),
    );
  }
}
