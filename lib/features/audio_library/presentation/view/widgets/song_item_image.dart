import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen_to_me/core/utils/assets.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_player/presentation/view/widgets/gradient_background.dart';

class SongItemImage extends StatelessWidget {
  final SongEntity? song;
  final double size;
  final BorderRadius? borderRadius;
  const SongItemImage(
      {super.key, required this.song, this.size = 70, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? kBorderRadius10,
        image: song?.artwork == null
            ? null
            : DecorationImage(
                image: MemoryImage(song!.artwork!), fit: BoxFit.cover),
      ),
      child: song?.artwork == null
          ? GradientBackground(
              child: Padding(
                padding: kPaddingAll8,
                child: SvgPicture.asset(Assets.musicIcon),
              ),
            )
          : null,
    );
  }
}
