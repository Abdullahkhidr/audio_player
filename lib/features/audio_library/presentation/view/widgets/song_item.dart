import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/router/app_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/song_item_image.dart';

import 'song_info.dart';

class SongItem extends StatelessWidget {
  final SongEntity song;
  const SongItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.audioPlayerView, extra: song);
      },
      child: Container(
        margin: kPaddingAll4,
        padding: EdgeInsets.symmetric(
            horizontal: kPaddingAll16.left, vertical: kPaddingAll8.bottom),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kBorderRadius10,
        ),
        child: Row(
          children: [
            SongItemImage(image: song.artwork),
            SizedBox(width: kPaddingAll16.left),
            Expanded(child: SongInfo(song: song)),
            // SizedBox(width: kPaddingAll8.right),
            // PlayButton(onPressed: () {}, iconSize: 35),
            SizedBox(width: kPaddingAll16.right),
            const Icon(FontAwesomeIcons.ellipsisVertical, size: 18)
          ],
        ),
      ),
    );
  }
}
