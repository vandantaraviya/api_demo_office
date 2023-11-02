import 'package:api_demo_office/Utils/Common/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../Common/AppString.dart';
import 'Custom_Text.dart';

class CustomshowDialog extends StatelessWidget {
  final String text;
  final String canceltitle;
  final String title;
  final GestureTapCallback? ontap;
  const CustomshowDialog({Key? key, required this.text,required this.canceltitle, required this.title, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Material(
                child: Column(
                  children: [
                    Container(
                      height: 5.h,
                      width: 350.w,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: AppString.areyousuer,
                            fontSize: 15,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomText(
                      text: text,
                      fontSize: 12,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: ()=> Get.back(),
                              child: Container(
                                height: 5.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.primaryColor,),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: canceltitle,
                                    fontSize: 12,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: ontap,
                              child: Container(
                                height: 5.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  //border: Border.all(color: AppColors.primaryColor,),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: title,
                                    fontSize: 12,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}
