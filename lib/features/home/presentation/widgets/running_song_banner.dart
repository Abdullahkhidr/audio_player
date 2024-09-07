import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/router/app_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/core/widgets/play_button.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/song_item_image.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';

class RunningSongBanner extends StatelessWidget {
  final AudioPlayerProvider audioPlayerProvider;
  const RunningSongBanner({
    super.key,
    required this.audioPlayerProvider,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.audioPlayerView, extra: audioPlayerProvider.song);
      },
      child: Container(
        decoration: BoxDecoration(
            color: kTextColor,
            border: Border.all(width: 1, color: kTertiaryColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 4,
              )
            ]),
        padding: EdgeInsets.symmetric(
            horizontal: kPaddingAll20.left, vertical: kPaddingAll8.top + 4),
        child: Row(
          children: [
            SongItemImage(
                song: audioPlayerProvider.song,
                size: 60,
                borderRadius: kBorderRadius50),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kPaddingAll4.vertical),
                child: Text(audioPlayerProvider.song!.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.style12.copyWith(
                        fontWeight: FontWeight.w600, color: kOnPrimaryColor)),
              ),
            ),
            StreamBuilder<bool>(
                stream: audioPlayerProvider.isPlaying,
                builder: (context, snapshot) {
                  return PlayButton(
                      onPressed: () => audioPlayerProvider.togglePlay(),
                      iconSize: 30,
                      isPlaying: snapshot.data ?? false);
                }),
            IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.forwardStep,
                    size: 20, color: kPrimaryColor))
          ],
        ),
      ),
    );
  }
}
