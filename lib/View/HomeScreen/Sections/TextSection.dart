import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Model/Custom/Custom_TextFeild.dart';
import '../../../utils/AppColors.dart';
import '../../../viewModel/Bloc/Translate_Cubit/translate_cubit.dart';
import 'TranslatedSectuon.dart';

class TranslateSection extends StatelessWidget {
  const TranslateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<TranslateCubit, TranslateState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextField(controller: TranslateCubit.get(context).textWantToTrans, backGround: AppColor.lightGrey,maxLine: 6,label: "Enter Text",validator: (value){
            if(value!.isEmpty){
               return "Enter a Tetx";
            }
          },),
          SizedBox(height: 20.h,),
          const TranslatedSection()
         ],
      ),
    );
  },
)
    ;
  }
}
