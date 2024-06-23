import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Model/Custom/Custom_Btn.dart';
import '../../../Model/Custom/Custom_text.dart';
import '../../../utils/AppColors.dart';
import '../../../viewModel/Bloc/LanguageCubit/language_cubit.dart';
import '../../../viewModel/Bloc/Translate_Cubit/translate_cubit.dart';
import '../../../viewModel/Bloc/UserCubit/user_cubit.dart';
class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var userCubit = UserCubit.get(context);
    var langCubit = LanguageCubit.get(context);
    var transCubit = TranslateCubit.get(context);
    return AlertDialog(
      backgroundColor: AppColor.lightBlue,
      icon: const Center(child: FaIcon(FontAwesomeIcons.database)),
      title: const CustomText(text: "Do You Want To Save ?" ,fontSize: 18,fontWeight: FontWeight.bold,),
      actions: [
        CustomButton(text: "Yes", color: AppColor.white, onTap:() {
          userCubit.saveTranslatedToFire(from: langCubit.selectedLangToTrans.toString(), to: langCubit.selectedToTrans, text: transCubit.textWantToTrans.text, translatedText: transCubit.translatedText,).then((value) {
            Navigator.pop(context);
          });
        }, ),
        SizedBox(height: 10.h,),
        CustomButton(text: "NO", color: AppColor.white, onTap:() {
          Navigator.pop(context);
        }, )
      ],
    );
  }
}
