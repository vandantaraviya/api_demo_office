import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Custom_Text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textstylecolor;
  final GestureTapCallback? ontap;
  const CustomButton({super.key,required this.text, this.color,this.textstylecolor,this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 6.h,
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
            child: CustomText(
              text: text,
              color: textstylecolor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            )),
      ),
    );
  }
}

