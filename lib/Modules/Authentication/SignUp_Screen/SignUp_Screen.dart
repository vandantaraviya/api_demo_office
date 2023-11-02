import 'package:api_demo_office/Utils/Common/AppString.dart';
import 'package:api_demo_office/Utils/Common_Widget/Custom_Textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../Authentication_Controller.dart';


class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  final  AuthenticationController authenticationController =   Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>  Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CustomTextField(
            titleText: AppString.yourname,
            textEditingController: authenticationController.nameController,
            textInputAction: TextInputAction.next,
          ),
              CustomTextField(
                titleText: AppString.youremail,
                textEditingController: authenticationController.emailSignupController,
                textInputAction: TextInputAction.next,
              ),
              CustomTextField(
                titleText: AppString.password,
                textEditingController: authenticationController.passwordSignupcontroller,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 11.h,
              ),
              SizedBox(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: () async {
                    authenticationController.signUp();
                  },
                  child: (authenticationController.isLoading.value)
                      ?  const CircularProgressIndicator(
                    color: Colors.white,
                  ) :  Text(AppString.creataccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
