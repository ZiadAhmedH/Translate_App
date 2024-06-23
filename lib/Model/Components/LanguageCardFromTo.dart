import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator_app/utils/AppColors.dart';

import '../Custom/Custom_text.dart';
class LangCard extends StatelessWidget {


  final String languageFrom;
  final String languageTo;

  const LangCard({super.key, required this.languageFrom, required this.languageTo});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: AppColor.white,
      child: Padding(
      padding:const EdgeInsets.all(5.0),
      child: Row(
        children: [
          CustomText(text: languageFrom,fontWeight: FontWeight.bold,),
          FaIcon(FontAwesomeIcons.arrowRight , color: AppColor.grey,size: 20,),
          CustomText(text: languageTo,fontWeight: FontWeight.bold,),
        ],
      ),
    ),);
  }
}
