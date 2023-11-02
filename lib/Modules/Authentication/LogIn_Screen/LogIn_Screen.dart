import 'package:api_demo_office/Utils/Common_Widget/Custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../Routes/routes.dart';
import '../../../Utils/Common/AppString.dart';
import '../../../Utils/Common_Widget/Custom_Textfiled.dart';
import '../Authentication_Controller.dart';

class LogInScreen extends StatelessWidget {
   LogInScreen({super.key});
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                titleText: AppString.youremail,
                textEditingController: authenticationController.email,
                textInputAction: TextInputAction.next,
              ),
              CustomTextField(
                titleText: AppString.password,
                textEditingController: authenticationController.password,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
                  onPressed: () async {
                      authenticationController.login();
                  },
                  child: (authenticationController.loading.value)
                      ?  const CircularProgressIndicator(
                        color: Colors.white,
                      )
                      :  Text(AppString.login),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.signUp);
                },
                child: CustomText(
                  text: AppString.creataccount,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
