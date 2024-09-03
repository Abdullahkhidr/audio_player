import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen_to_me/core/utils/assets.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class SongItemImage extends StatelessWidget {
  final SongEntity song;
  const SongItemImage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius10,
        image: song.artwork == null
            ? null
            : DecorationImage(
                image: MemoryImage(song.artwork!), fit: BoxFit.cover),
      ),
      child: song.artwork == null ? SvgPicture.asset(Assets.musicIcon) : null,
    );
  }
}
