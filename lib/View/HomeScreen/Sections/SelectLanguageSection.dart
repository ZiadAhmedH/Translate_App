import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Model/Components/LanguageCard.dart';
import '../../../Model/Components/language_Btn.dart';
import '../../../utils/AppColors.dart';
import '../../../viewModel/Bloc/LanguageCubit/language_cubit.dart';
import '../../../viewModel/Bloc/Translate_Cubit/translate_cubit.dart';
class SelectLanguageSection extends StatelessWidget {
  const SelectLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    var langCubit = LanguageCubit.get(context);
    var transCubit = TranslateCubit.get(context);
    return BlocConsumer<LanguageCubit, LanguageState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LangBtn(
          SelectedLanguage:
          langCubit.selectedLangToTrans ?? "English",
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: langCubit.languagesMap.length,
                    itemBuilder: (context, index) {
                      return LanguageCard(
                          language: langCubit.languagesMap.keys
                              .toList()[index],
                          onTap: () => langCubit.selectLanguage(
                              selectedLanguage: langCubit
                                  .languagesMap.keys
                                  .toList()[index]));
                    },
                  ),
                );
              },
            );
          },
        ),
        IconButton(
          color: AppColor.grey,
          onPressed: () {
            langCubit.switchLanguages();
            transCubit.swapTranslatedText();
          },
          icon: const FaIcon(FontAwesomeIcons.arrowRightArrowLeft),
        ),
        LangBtn(
          SelectedLanguage: langCubit.selectedToTrans ?? "English",
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: langCubit.languagesMap.length,
                    itemBuilder: (context, index) {
                      return LanguageCard(
                          language: langCubit.languagesMap.keys
                              .toList()[index],
                          onTap: () =>
                              langCubit.selectLanguageToTrans(
                                  selectedLanguage: langCubit
                                      .languagesMap.keys
                                      .toList()[index]));
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  },
);;
  }
}
