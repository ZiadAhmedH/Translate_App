import 'package:flutter/material.dart';
import 'package:translator_app/View/SignUp_Login_Screens/SignUpScreen.dart';
import '../../../Model/Custom/Custom_text.dart';
import '../../../utils/AppColors.dart';
class AddAccountSection extends StatelessWidget {
  const AddAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: "Don't have any account? ",color: AppColor.lightBlack,fontWeight: FontWeight.w700,fontSize: 16,),
        InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),)),
            child: CustomText(text: "Register",color: AppColor.lightPurple,fontWeight: FontWeight.w700,)),
      ],
    );
  }
}
