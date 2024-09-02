import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';

import 'audio_controls.dart';
import 'audio_info.dart';
import 'audio_progress.dart';
import 'custom_audio_player_app_bar.dart';

class AudioPlayerBody extends StatelessWidget {
  const AudioPlayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
            leading: SizedBox(),
            backgroundColor: Colors.transparent,
            flexibleSpace: CustomMusicPlayerAppBar()),
        SliverFillRemaining(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AudioInfo(),
                  Padding(
                      padding: kPaddingAll20,
                      child: Divider(color: kTertiaryColor)),
                  const AudioProgress(),
                  const AudioControls(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
