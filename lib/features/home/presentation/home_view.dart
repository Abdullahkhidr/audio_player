import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';
import 'package:listen_to_me/features/home/presentation/widgets/running_song_banner.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  final AudioPlayerProvider audioPlayerProvider;
  const HomeView({super.key, required this.audioPlayerProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: HomeViewBody()),
      bottomNavigationBar: audioPlayerProvider.song != null
          ? RunningSongBanner(audioPlayerProvider: audioPlayerProvider)
          : const SizedBox.shrink(),
    );
  }
}
