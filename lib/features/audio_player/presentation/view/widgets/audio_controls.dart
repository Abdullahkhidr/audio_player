import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/widgets/play_button.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';
import 'package:provider/provider.dart';

class AudioControls extends StatelessWidget {
  const AudioControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioPlayerProvider, child) => Padding(
        padding: kPaddingAll20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.backwardStep)),
            IconButton(
                onPressed: () {
                  audioPlayerProvider.seekBackward();
                },
                icon: const Icon(FontAwesomeIcons.backward)),
            PlayButton(
                onPressed: () => audioPlayerProvider.togglePlay(),
                isPlaying: audioPlayerProvider.isPlaying,
                iconSize: 60),
            IconButton(
                onPressed: () {
                  audioPlayerProvider.seekForward();
                },
                icon: const Icon(FontAwesomeIcons.forward)),
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.forwardStep)),
          ],
        ),
      ),
    );
  }
}
