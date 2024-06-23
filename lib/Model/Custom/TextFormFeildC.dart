
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/AppColors.dart';

class CustomTextFieldC extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? icon;
  final Color? iconColor;
  final Color? borderColor;
  final double? height;
  final int? maxLine;
  final TextInputType? keyboardType; // New parameter for keyboard type
  final bool? readOnly;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;
  CustomTextFieldC({
    required this.hintText,
    required this.controller,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.validator,
    this.height,
    this.maxLine,
    this.keyboardType, this.readOnly, this.onTap, this.onChanged, this.suffixIcon, this.obscureText, // Added keyboardType parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          obscureText: obscureText ?? false,
          onChanged:onChanged ,
          onTap: onTap ?? (){},
          controller: controller,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            labelText: hintText,
            prefixIcon: icon,
            suffixIcon:suffixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 2,
                color: borderColor?? AppColor.lightGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 4,
                color: borderColor ?? AppColor.lightGrey ,
              ),
            ),
            contentPadding: const EdgeInsets.all(20.0),
          ),
          validator: validator,
          keyboardType: keyboardType,

          style: TextStyle(color: AppColor.lightBlack,fontSize: 18.h),

        ),
      ),
    );
  }
}