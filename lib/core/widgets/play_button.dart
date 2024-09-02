import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/constants.dart';

class PlayButton extends StatelessWidget {
  final bool isPlaying;
  final Function() onPressed;
  final double iconSize;
  const PlayButton(
      {super.key,
      this.isPlaying = false,
      required this.onPressed,
      this.iconSize = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: IconButton.filledTonal(
          style: IconButton.styleFrom(
              backgroundColor: kPrimaryColor, iconSize: iconSize * 0.5),
          onPressed: onPressed,
          icon: isPlaying
              ? const Icon(FontAwesomeIcons.pause, color: Colors.white)
              : const Icon(FontAwesomeIcons.play, color: Colors.white)),
    );
  }
}
