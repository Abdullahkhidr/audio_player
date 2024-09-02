import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/sort_by_widget.dart';

class CustomLibraryAppBar extends StatelessWidget {
  final String title;
  const CustomLibraryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll20,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyles.style20),
              const SortByWidget(),
            ],
          ),
          SizedBox(height: kPaddingAll8.top),
          Divider(color: kTertiaryColor),
        ],
      ),
    );
  }
}
