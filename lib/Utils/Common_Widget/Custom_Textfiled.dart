import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Common/AppColors.dart';
import 'Custom_Text.dart';


class CustomTextField extends StatelessWidget {
  final String titleText;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  const CustomTextField({
    super.key,
    required this.titleText,
    required this.textEditingController,
    this.onChanged,this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        CustomText(
          text: titleText,
          color: AppColors.primaryColor,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        TextFormField(
          decoration:  const InputDecoration(
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor,),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor,),
            ),
          ),
          onChanged: onChanged,
          controller: textEditingController,
          textInputAction: textInputAction,
        ),
      ],
    );
  }
}

