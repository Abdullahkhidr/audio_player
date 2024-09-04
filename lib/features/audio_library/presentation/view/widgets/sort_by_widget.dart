import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';

import 'sort_options_widget.dart';

class SortByWidget extends StatelessWidget {
  const SortByWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return const SortOptionsWidget();
            });
      },
      child: Row(
        children: [
          Text('Sort by',
              style: TextStyles.style16.copyWith(
                  color: kSecondaryColor, fontWeight: FontWeight.normal)),
          SizedBox(width: kPaddingAll8.horizontal),
          const Icon(FontAwesomeIcons.sort),
        ],
      ),
    );
  }
}
