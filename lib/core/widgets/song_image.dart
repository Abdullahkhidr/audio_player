import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen_to_me/core/utils/assets.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongImage extends StatelessWidget {
  final double size;
  const SongImage({
    super.key,
    required this.song,
    required this.size,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
        id: song.id,
        nullArtworkWidget: SizedBox(
          width: size,
          height: size,
          child: Container(
            padding: kPaddingAll16,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: kBorderRadius10,
            ),
            child: SvgPicture.asset(Assets.musicIcon,
                width: size, height: size),
          ),
        ),
        type: ArtworkType.AUDIO,
        artworkWidth: size,
        artworkHeight: size,
        artworkBorder: kBorderRadius10);
  }
}
