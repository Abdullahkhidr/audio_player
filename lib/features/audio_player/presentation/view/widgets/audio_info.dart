import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/core/widgets/song_image.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';
import 'package:provider/provider.dart';

class AudioInfo extends StatelessWidget {
  const AudioInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final song = context.watch<AudioPlayerProvider>().song;
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: kPaddingAll20,
      child: Column(children: [
        SongImage(song: song, size: size.width * 0.8),
        SizedBox(height: kPaddingAll8.vertical),
        Text(song.title,
            textAlign: TextAlign.center, style: TextStyles.style20),
        SizedBox(height: kPaddingAll4.vertical),
        Text(song.artist,
            style: TextStyles.style16.copyWith(color: kSecondaryColor)),
      ]),
    );
  }
}
