import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator_app/View/SignUp_Login_Screens/LoginScreen.dart';
import 'package:translator_app/viewModel/Bloc/AuthCubit/auth_cubit.dart';
import 'package:translator_app/viewModel/Data/Local/SharedKeys.dart';
import 'package:translator_app/viewModel/Data/Local/SharedPrefrence.dart';
import '../../../Model/Custom/Custom_Btn.dart';
import '../../../Model/Custom/Custom_text.dart';
import '../../../utils/AppColors.dart';
import '../../../viewModel/Bloc/LanguageCubit/language_cubit.dart';
import '../../../viewModel/Bloc/Translate_Cubit/translate_cubit.dart';
import '../../../viewModel/Bloc/UserCubit/user_cubit.dart';
class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return AlertDialog(
      backgroundColor: AppColor.lightBlue,
      title: CircleAvatar(
        radius: 50.spMax,
        backgroundColor: AppColor.lightGrey2,
        child: CustomText(text: LocalData.getData(key: SharedKey.userName)[0].toString().toUpperCase(),fontWeight: FontWeight.bold,fontSize: 20,),
      ),
      actions: [

    Center(child: CustomText(text: LocalData.getData(key: SharedKey.email).toString(),fontSize: 18,fontWeight: FontWeight.bold,)),
        SizedBox(height: 10.h,),
        CustomButton(text: "Sign Out", color: AppColor.grey,textColor: AppColor.white, onTap: (){
          authCubit.signOut().then((value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          });
        }),
      ],
    );
  }
}
