
import 'package:caretutors/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  bool? obscureText;
  String hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  FormFieldValidator? validator;
  CustomTextForm({
    Key? key,
     this.controller,
     this.obscureText,
     this.keyboardType,
     this.validator,
     required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: 65,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText==null? false : true,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          fillColor: AppColors.defaultWhite,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.greenColor,width: 2
            )
          ),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                  color: AppColors.defaultWhite,width: 2
              )
          ),

          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                  color: AppColors.greenColor,width: 2
              )
          ),

        ),
      ),
    );
  }
}
