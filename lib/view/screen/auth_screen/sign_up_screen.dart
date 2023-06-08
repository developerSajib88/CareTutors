import 'package:caretutors/utils/app_constants.dart';
import 'package:caretutors/utils/font_styles.dart';
import 'package:caretutors/view/widget/custom_button.dart';
import 'package:caretutors/view/widget/custom_text_form.dart';
import 'package:flutter/material.dart';

import '../../widget/backgrount_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  /// This function is called from elevated button
  void submitUserData(){
   if(formKey.currentState!.validate()){

   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: Container(width: double.infinity,height: double.infinity,padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,children: [

                const SizedBox(height: 50,),

                Text(AppConstants.JOIN_WITH_US,style: FontStyles.headerTextStyle,),

                const SizedBox(height: 20,),

                CustomTextForm(
                  controller: emailController,
                  hintText: AppConstants.EMAIL,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value.toString().isEmpty){
                      return "This field is required";
                    }else if(value.toString().length < 10){
                      return "Enter your valid email";
                    }
                  },
                ),

                const SizedBox(height: 15,),

                CustomTextForm(
                  controller: firstNameController,
                  keyboardType: TextInputType.name,
                  hintText: AppConstants.FIRST_NAME,
                  validator: (value){
                    if(value.toString().isEmpty) return "This field is required";
                  },

                ),

                const SizedBox(height: 15,),

                CustomTextForm(
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                  hintText: AppConstants.LAST_NAME,
                  validator: (value){
                    if(value.toString().isEmpty) return "This field is required";
                  },
                ),

                const SizedBox(height: 15,),

                CustomTextForm(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  hintText: AppConstants.MOBILE,
                  validator: (value){
                    if(value.toString().isEmpty) {
                      return "This field is required";
                    } else if(value.toString().length < 11){
                      return "Enter your valid mobile number";
                    }
                  },
                ),

                const SizedBox(height: 15,),

                CustomTextForm(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: AppConstants.PASSWORD,
                  validator: (value){
                    if(value.toString().length < 6){
                      return "Required minimum 6 digit password";
                    }
                  },
                ),

                const SizedBox(height: 15,),


                CustomTextForm(
                  obscureText: true,
                  controller: confirmPasswordController,
                  hintText: AppConstants.CONFIRM_PASSWORD,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(passwordController.text.toString() != value.toString()){
                      return "Confirm password is not match";
                    }
                  },
                ),

                const SizedBox(height: 20,),

                CustomButton(
                    onPressed: ()=> submitUserData(),
                    child: const Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                )


              ],),
            ),
          ),),
      )
    );
  }
}
