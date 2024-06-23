import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/AppColors.dart';
import '../Custom/Custom_text.dart';
class GoogleAppBar extends StatelessWidget {
  const GoogleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.h,
        ),
        CustomText(
          text: "Google",
          fontFamily: "Poppins",
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: AppColor.grey,
        ),
         SizedBox(
          width: 5.h,
        ),
        CustomText(
          text: "Translate",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColor.grey,
        ),
      ],
    );
  }
}
