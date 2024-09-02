import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';
import 'package:provider/provider.dart';

class AudioProgress extends StatefulWidget {
  const AudioProgress({super.key});

  @override
  State<AudioProgress> createState() => _AudioProgressState();
}

class _AudioProgressState extends State<AudioProgress> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        initialData: Duration.zero,
        value: context.read<AudioPlayerProvider>().audioPlayer.positionStream,
        builder: (context, child) {
          final audioPlayerProvider = context.read<AudioPlayerProvider>();
          final position = context.watch<Duration>();
          final duration = audioPlayerProvider.audioPlayer.duration ??
              const Duration(milliseconds: 1);
          return Column(
            children: [
              Slider.adaptive(
                max: duration.inMilliseconds.toDouble() + 100,
                value: position.inMilliseconds.toDouble(),
                secondaryTrackValue: audioPlayerProvider
                    .audioPlayer.bufferedPosition.inMilliseconds
                    .toDouble(),
                inactiveColor: kTertiaryColor,
                onChanged: (value) {
                  audioPlayerProvider
                      .seek(Duration(milliseconds: value.toInt()));
                },
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kPaddingAll16.horizontal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _DurationView(duration: position),
                    _DurationView(duration: duration),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class _DurationView extends StatelessWidget {
  final Duration duration;
  const _DurationView({required this.duration});

  @override
  Widget build(BuildContext context) {
    return Text(
      duration.toString().split('.').first,
      style: TextStyles.style14
          .copyWith(fontWeight: FontWeight.w600, color: kSecondaryColor),
    );
  }
}
