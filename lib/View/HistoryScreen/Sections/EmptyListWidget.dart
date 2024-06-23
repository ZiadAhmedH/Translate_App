import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Model/Custom/Custom_text.dart';
class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: "There is No History"),
          FaIcon(FontAwesomeIcons.faceSadCry)
        ],
      ),
    );
  }
}
