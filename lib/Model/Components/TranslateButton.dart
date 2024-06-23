import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/AppColors.dart';
import '../../viewModel/Bloc/InternetCheck/internet_cubit.dart';
import '../../viewModel/Bloc/LanguageCubit/language_cubit.dart';
import '../../viewModel/Bloc/Translate_Cubit/translate_cubit.dart';
import '../Custom/Custom_text.dart';
class TranslateBtn extends StatelessWidget {

  const TranslateBtn({super.key});

  @override
  Widget build(BuildContext context) {
    var transCubit = TranslateCubit.get(context);
    var langCubit = LanguageCubit.get(context);
    var interCubit = InternetCubit.get(context);
    return BlocBuilder<InternetCubit, InternetState>(
  builder: (context, state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/11,
      child: TextButton(
          style: ButtonStyle( backgroundColor: MaterialStatePropertyAll(AppColor.lightBlue)),
          onPressed:(){
                if(interCubit.isConnected){
                  transCubit.translateText(from:langCubit.from, toText: langCubit.to);
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: AppColor.Red, content: const CustomText(text:"NO Connection", fontWeight: FontWeight.bold,)));
                }

          }, child: const CustomText(text: "Translate",fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 20,)),
    );
  },
);
  }
}
