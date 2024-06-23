import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Model/Custom/Custom_text.dart';
import '../../../utils/AppColors.dart';
import '../../../viewModel/Bloc/Translate_Cubit/translate_cubit.dart';

class TranslatedSection extends StatelessWidget {
  const TranslatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TranslateCubit, TranslateState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width - 12,
      decoration: BoxDecoration(
          color: AppColor.lightGrey,
          borderRadius: BorderRadius.circular(12)
      ),
      child: ListView(children: [
        CustomText(text:TranslateCubit.get(context).translatedText,fontWeight: FontWeight.w700,color: AppColor.grey,fontSize: 22,)
      ] ),
    );
  },
)
    ;
  }
}
