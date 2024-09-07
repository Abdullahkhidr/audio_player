import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/widgets/custom_button.dart';

class FolderActions extends StatelessWidget {
  const FolderActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll16,
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
                  onPressed: () {},
                  text: 'Shuffle',
                  icon: FontAwesomeIcons.shuffle)),
          Expanded(
              child: CustomButton(
                  onPressed: () {},
                  isSecondary: true,
                  text: 'Play',
                  icon: FontAwesomeIcons.play)),
        ],
      ),
    );
  }
}
