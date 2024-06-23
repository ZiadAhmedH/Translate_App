import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator_app/Model/Custom/Custom_text.dart';
import 'package:translator_app/View/HistoryScreen/Sections/EmptyListWidget.dart';
import 'package:translator_app/View/HistoryScreen/Sections/HistoryTranslateWidget.dart';
import 'package:translator_app/utils/AppColors.dart';
import '../../viewModel/Bloc/UserCubit/user_cubit.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userCubit = UserCubit.get(context);

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: "Saved Translation",
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              color: AppColor.black,
              fontSize: 20,
            ),
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const FaIcon(FontAwesomeIcons.arrowLeft),
            ),
          ),
          body: userCubit.translationHistory.isEmpty
              ? const EmptyList()
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100.h,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:HistoryTranslateWidget(from: userCubit.translationHistory[index].from.toString(), to: userCubit.translationHistory[index].to.toString(), before: userCubit.translationHistory[index].text.toString(), after: userCubit.translationHistory[index].translatedText.toString(),id: userCubit.translationHistory[index].uidTarns.toString(),)
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: userCubit.translationHistory.length),
        );
      },
    );
  }
}
