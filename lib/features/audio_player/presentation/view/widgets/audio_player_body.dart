import 'package:flutter/material.dart';

import 'audio_controls.dart';
import 'audio_info.dart';
import 'audio_progress.dart';
import 'custom_audio_player_app_bar.dart';
import 'gradient_background.dart';

class AudioPlayerBody extends StatelessWidget {
  const AudioPlayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientBackground(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
              leading: SizedBox(),
              backgroundColor: Colors.transparent,
              flexibleSpace: CustomMusicPlayerAppBar()),
          SliverFillRemaining(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AudioInfo(),
                    AudioProgress(),
                    AudioControls(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
