
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/AppColors.dart';
import '../Custom/Custom_text.dart';
class LangBtn extends StatelessWidget {


    String SelectedLanguage ;
    void Function()? onTap;
   LangBtn({super.key , required this.SelectedLanguage,this.onTap});


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width/2.5,
      height: MediaQuery.of(context).size.height/11,
      child: TextButton(
        onPressed: onTap,
        child: CustomText(text: SelectedLanguage,fontWeight: FontWeight.w500),style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColor.lightBlue),),
      ),
    );
  }
}
