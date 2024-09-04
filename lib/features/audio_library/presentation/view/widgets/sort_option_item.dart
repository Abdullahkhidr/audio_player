import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/songs_provider.dart';

class SortOptionItem extends StatelessWidget {
  final Function(SortOption) onTap;
  const SortOptionItem(
      {super.key,
      required this.title,
      this.isSelected = false,
      required this.sortOption,
      required this.onTap});
  final String title;
  final bool isSelected;
  final SortOption sortOption;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(sortOption);
      },
      title: Text(title, style: TextStyles.style16),
      trailing: Icon(isSelected
          ? FontAwesomeIcons.solidCircleCheck
          : FontAwesomeIcons.circleCheck),
    );
  }
}
