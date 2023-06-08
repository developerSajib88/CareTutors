import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/utils/app_colors.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:caretutors/utils/font_styles.dart';
import 'package:caretutors/view/screen/auth_screen/sign_up_screen.dart';
import 'package:caretutors/view/screen/navigation_screen/bottom_navigation_screen.dart';
import 'package:caretutors/view/widget/custom_button.dart';
import 'package:caretutors/view/widget/custom_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../widget/backgrount_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  ValueNotifier<bool> loading = ValueNotifier(false);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// This function is called from elevated button
  void sendLogInData(context)async{
    if(formKey.currentState!.validate()){
      loading.value = true;
      bool result = await Provider.of<AuthController>(context,listen: false).userLogIn(emailController.text, passwordController.text,);
      if(result){
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> const BottomNavigationScreen()));
        loading.value = false;
      }else{
        loading.value = false;
      }

    }
  }




  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        body: BackgroundScreen(
          child: Container(width: double.infinity,height: double.infinity,padding: const EdgeInsets.all(40),
            child: Form(
              key: formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,children: [

                const SizedBox(height: 50,),

                Text(AppConstants.GET_STARTED_WITH,style: FontStyles.headerTextStyle,),

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

                const SizedBox(height: 5,),


                CustomTextForm(
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: AppConstants.PASSWORD,
                  validator: (value){
                    if(value.toString().length < 6){
                      return "Required minimum 6 digit password";
                    }
                  },
                ),


                const SizedBox(height: 20,),

                ValueListenableBuilder(
                    valueListenable: loading,
                    builder: (context,value,_){
                      return CustomButton(
                          onPressed: ()=> sendLogInData(context),
                          child: Visibility(
                              visible: loading.value == false,
                              replacement: const SizedBox(width: 20,height: 20,
                                child: Center(
                                  child: CircularProgressIndicator(color: AppColors.defaultWhite,),
                                ),),
                              child: const Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                          )
                      );
                    }
                ),

                const  SizedBox(height: 10,),


                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Don't have account?",style: FontStyles.titleTextStyle,),
                  TextButton(
                      onPressed: ()=>Navigator.push(context, CupertinoPageRoute(builder: (context)=>const SignUpScreen())),
                      child: const Text("Sign Up",style: TextStyle(color: AppColors.greenColor,fontWeight: FontWeight.w700,fontSize: 15),),
                  )
                ],)




              ],),
            ),),
        )
    );
  }
}
