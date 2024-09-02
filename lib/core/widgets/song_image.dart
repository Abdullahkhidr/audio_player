import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen_to_me/core/utils/assets.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

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
    return song.artwork != null
        ? Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: kBorderRadius10,
                image: DecorationImage(
                    fit: BoxFit.cover, image: MemoryImage(song.artwork!))))
        : _DefaultImage(size: size);
  }
}

class _DefaultImage extends StatelessWidget {
  final double size;
  const _DefaultImage({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Padding(
        padding: kPaddingAll8,
        child: SvgPicture.asset(
          Assets.musicIcon,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
