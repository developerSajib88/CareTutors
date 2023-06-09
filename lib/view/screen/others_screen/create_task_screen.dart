import 'package:caretutors/controller/auth_controller/auth_controller.dart';
import 'package:caretutors/controller/task_controller/task_controller.dart';
import 'package:caretutors/utils/app_constants.dart';
import 'package:caretutors/view/widget/custom_appbar.dart';
import 'package:caretutors/view/widget/custom_button.dart';
import 'package:caretutors/view/widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/font_styles.dart';
import '../../widget/background_widget.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {

  ValueNotifier<bool> loading = ValueNotifier(false);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void createTask()async{
    if(formKey.currentState!.validate()){
      loading.value = true;
      bool result = await context.read<TaskController>().createNewTask(
          context.read<AuthController>().userToken,
          subjectController.text,
          descriptionController.text
      );

      if(result){
        subjectController.clear();
        descriptionController.clear();
        context.read<TaskController>().getNewTaskList(context.read<AuthController>().userToken);
        loading.value = false;
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: BackgroundScreen(
        child: CustomAppBar(
          child: Form(
            key: formKey,
            child: Padding(padding: const EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  Text(AppConstants.ADD_NEW_TASK,style: FontStyles.headerTextStyle,),

                  const SizedBox(height: 20,),

                  CustomTextForm(
                    controller: subjectController,
                    hintText: AppConstants.SUBJECT,
                    validator: (value){
                      if(value.toString().isEmpty){
                        return "This field is required";
                      }
                    },
                  ),


                  const SizedBox(height: 1,),



                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value.toString().isEmpty){
                      return "This field is required";
                    }
                  },
                  minLines: 8,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: AppConstants.DESCRIPTION,
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





                  const SizedBox(height: 20,),


                  ValueListenableBuilder(
                      valueListenable: loading,
                      builder: (context,value,_){
                        return CustomButton(
                            onPressed: ()=> createTask(),
                            child: Visibility(
                              visible: loading.value == false,
                              replacement: const SizedBox(width: 20,height: 20,child: Center(child: CircularProgressIndicator(color: Colors.white,),),),
                                child: const Icon(Icons.arrow_circle_right_outlined))
                        );
                      }
                  )



                ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
