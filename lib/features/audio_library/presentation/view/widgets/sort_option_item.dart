import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';

class SortOptionItem extends StatelessWidget {
  const SortOptionItem(
      {super.key, required this.title, this.isSelected = false});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(title, style: TextStyles.style16),
      trailing: Icon(isSelected
          ? FontAwesomeIcons.solidCircleCheck
          : FontAwesomeIcons.circleCheck),
    );
  }
}
