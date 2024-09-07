import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/methods/capitalize.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/songs_provider.dart';
import 'package:provider/provider.dart';

import 'sort_options_widget.dart';

class SortByWidget extends StatelessWidget {
  const SortByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final songsProvider = context.watch<SongsProvider>();
    return Row(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SortOptionsWidget(
                    onTap: (sortOption) {
                      songsProvider.setSortOption(sortOption);
                      GoRouter.of(context).pop();
                    },
                    selectedSortOption: songsProvider.sortOption,
                  );
                });
          },
          child: Text(
              songsProvider.sortOption.name.replaceAll('_', ' ').capitalize,
              style: TextStyles.style16.copyWith(color: kPrimaryColor)),
        ),
        SizedBox(width: kPaddingAll8.horizontal),
        InkWell(
          onTap: () {
            songsProvider.toggleSortOrder();
          },
          child: Icon(
            songsProvider.isAscending
                ? FontAwesomeIcons.arrowDownAZ
                : FontAwesomeIcons.arrowUpAZ,
            color: kPrimaryColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
