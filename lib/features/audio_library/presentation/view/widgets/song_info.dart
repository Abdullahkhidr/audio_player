import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    super.key,
    required this.song,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(song.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.style14),
        SizedBox(height: kPaddingAll4.top),
        Text('${song.artist} | ${song.duration.inMinutes} mins',
            style: TextStyles.style12),
      ],
    );
  }
}
