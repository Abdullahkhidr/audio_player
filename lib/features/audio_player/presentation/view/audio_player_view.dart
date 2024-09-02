import 'package:flutter/material.dart';

import 'widgets/audio_player_body.dart';

class AudioPlayerView extends StatelessWidget {
  const AudioPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AudioPlayerBody()));
  }
}
