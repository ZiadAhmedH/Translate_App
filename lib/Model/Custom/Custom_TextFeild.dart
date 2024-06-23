
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/AppColors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color backGround;
  final int maxLine ;
  final String label ;
  final bool readOnly;
  String? Function(String?)? validator;

  CustomTextField({
    required this.backGround,
    required this.maxLine,
    required this.label,
    this.readOnly = false,
    this.validator,
    required this.controller,
// Make readOnly optional with a default value of false
  });
  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      readOnly:readOnly ,
      controller: controller,
      decoration: InputDecoration(
          fillColor: backGround,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none
          ),
          labelText: label,
          alignLabelWithHint: true, // make the label at the begin of the textFeild!!
          labelStyle: TextStyle(fontSize: 20.h,fontWeight: FontWeight.w500,color: AppColor.grey)
      ),
      maxLines:maxLine,
      style: TextStyle(fontSize: 25,color: AppColor.grey,fontWeight: FontWeight.w600),
      validator: validator,
    );
  }
}