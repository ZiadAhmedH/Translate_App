import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator_app/Model/Components/Google_AppBar.dart';
import 'package:translator_app/View/HistoryScreen/HistoryScreen.dart';
import 'package:translator_app/View/HomeScreen/Sections/SelectLanguageSection.dart';
import 'package:translator_app/View/HomeScreen/Sections/dilogAlertConfermation.dart';
import 'package:translator_app/utils/AppColors.dart';
import '../../Model/Components/TranslateButton.dart';
import '../../viewModel/Bloc/UserCubit/user_cubit.dart';
import 'Sections/ShowProfileDialog.dart';
import 'Sections/TextSection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userCubit = UserCubit.get(context);
    return BlocProvider.value(
      value: userCubit..getUserShippingInfo(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const GoogleAppBar(),leading: IconButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (context) {
              return  ProfileDialog();
            },);

          },
          icon: FaIcon(FontAwesomeIcons.circleUser,color: AppColor.grey,),
        ),),
        body: ListView(
          children: [
            const SelectLanguageSection(),
            SizedBox(height: 20.h,),
            const TranslateSection(),
            const TranslateBtn()
          ],
        ),


        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return FloatingActionButton(
                    heroTag: "Btn2",
                    backgroundColor: AppColor.lightBlue,
                    child: const FaIcon(FontAwesomeIcons.floppyDisk),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const ConfirmDialog();
                        },
                      );
                    },
                  );
                },
              ),
              FloatingActionButton(
                heroTag: "Btn1",
                backgroundColor: AppColor.lightBlue,
                child: const FaIcon(FontAwesomeIcons.clockRotateLeft),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


