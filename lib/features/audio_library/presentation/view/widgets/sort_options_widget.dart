import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/sort_option_item.dart';

class SortOptionsWidget extends StatelessWidget {
  const SortOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: kPaddingAll4.top),
          const Text('Sort by', style: TextStyles.style18),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kPaddingAll8.top),
            child: Divider(color: kTertiaryColor),
          ),
          const SortOptionItem(title: 'Name'),
          const SortOptionItem(title: 'Size', isSelected: true),
          const SortOptionItem(title: 'Date modified'),
          const SortOptionItem(title: 'Date created'),
        ],
      ),
    );
  }
}
