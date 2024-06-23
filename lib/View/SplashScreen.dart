import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:translator_app/View/HomeScreen/HomeScreen.dart';
import 'package:translator_app/View/SignUp_Login_Screens/LoginScreen.dart';
import 'package:translator_app/utils/Constant.dart';

import '../utils/AppColors.dart';
import '../viewModel/Data/Local/SharedKeys.dart';
import '../viewModel/Data/Local/SharedPrefrence.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:AppColor.white,
        splash: Lottie.asset(Constant.google_translate) ,
        nextScreen:LocalData.getData(key: SharedKey.token)!=null ? const HomeScreen() : const LoginScreen(),
      duration: 3500,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
