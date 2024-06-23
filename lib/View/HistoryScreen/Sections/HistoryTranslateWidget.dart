import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Model/Components/LanguageCardFromTo.dart';
import '../../../Model/Custom/Custom_text.dart';
import '../../../viewModel/Bloc/UserCubit/user_cubit.dart';
class HistoryTranslateWidget extends StatelessWidget {



  final String from;
  final String to;
  final String before;
  final String after;
  final String id;

  const HistoryTranslateWidget({super.key, required this.from, required this.to, required this.before, required this.after, required this.id});
  @override
  Widget build(BuildContext context) {
    var userCubit = UserCubit.get(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LangCard(
                    languageFrom:from,
                    languageTo: to,
                  ),
                ],
              ),
              Expanded(
                  child: CustomText(
                    text: before,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              Expanded(
                  child: CustomText(
                    text:after,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  FlutterClipboard.copy("$from --> $to \n $before \n ------- \n $after").then(( value ){
                    Fluttertoast.showToast(msg: "Text Copied");
                  });
                },
                icon:
                const FaIcon(FontAwesomeIcons.copy)),
            IconButton(
                onPressed: () {
                userCubit.deleteTranslatedTextFromFire(uidTrans:id);
                },
                icon:
                const FaIcon(FontAwesomeIcons.xmark))
          ],
        )
      ],
    );
  }
}
