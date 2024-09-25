import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen_to_me/core/utils/assets.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_player/presentation/view/widgets/gradient_background.dart';

class SongItemImage extends StatelessWidget {
  final Uint8List? image;
  final double size;
  final BorderRadius? borderRadius;
  const SongItemImage(
      {super.key, this.size = 60, this.borderRadius, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? kBorderRadius10,
        image: image == null
            ? null
            : DecorationImage(image: MemoryImage(image!), fit: BoxFit.cover),
      ),
      child: image == null
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
