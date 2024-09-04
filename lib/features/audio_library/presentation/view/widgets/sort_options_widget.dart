import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/songs_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/sort_option_item.dart';

class SortOptionsWidget extends StatelessWidget {
  final Function(SortOption) onTap;
  final SortOption selectedSortOption;
  const SortOptionsWidget(
      {super.key, required this.onTap, required this.selectedSortOption});

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
          SortOptionItem(
              title: 'Name',
              sortOption: SortOption.name,
              onTap: onTap,
              isSelected: selectedSortOption == SortOption.name),
          SortOptionItem(
              title: 'Duration',
              sortOption: SortOption.duration,
              onTap: onTap,
              isSelected: selectedSortOption == SortOption.duration),
          SortOptionItem(
              title: 'Date Modified',
              sortOption: SortOption.date_modified,
              onTap: onTap,
              isSelected: selectedSortOption == SortOption.date_modified),
          SortOptionItem(
              title: 'Date Added',
              sortOption: SortOption.date_added,
              onTap: onTap,
              isSelected: selectedSortOption == SortOption.date_added),
        ],
      ),
    );
  }
}
