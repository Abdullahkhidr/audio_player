import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/constants.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll16,
      child: Row(
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.chevronLeft))
        ],
      ),
    );
  }
}
