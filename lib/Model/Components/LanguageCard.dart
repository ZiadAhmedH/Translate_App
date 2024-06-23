import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/Model/Custom/Custom_text.dart';
import 'package:translator_app/utils/AppColors.dart';

import '../../viewModel/Bloc/LanguageCubit/language_cubit.dart';
class LanguageCard extends StatelessWidget {

  final void Function()? onTap;
  final String language;

  const LanguageCard({super.key, required this.language, required this.onTap });

  @override
  Widget build(BuildContext context) {
    var langCubit = LanguageCubit.get(context);
    return  InkWell(
      hoverColor: AppColor.grey,
      onTap: onTap,
      child: Container(
        width: double.infinity,
           height: 50.h,
           decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 2, color: AppColor.lightGrey))
           ),
         child: Center(
           child: CustomText(
             text: language,
              color: AppColor.grey,
             fontSize: 25,
             fontWeight: FontWeight.bold,
           ),
         ),
      ),
    );
  }
}
