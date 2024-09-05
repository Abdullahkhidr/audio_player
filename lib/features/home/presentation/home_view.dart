import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/router/app_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/core/widgets/play_button.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';
import 'package:listen_to_me/features/audio_player/presentation/view/widgets/gradient_background.dart';

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
      child: GradientBackground(
        child: Container(
          height: 70,
          margin: kPaddingAll16,
          padding: EdgeInsets.symmetric(
              horizontal: kPaddingAll8.horizontal,
              vertical: kPaddingAll4.vertical),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kBorderRadius20.copyWith(
                topRight: const Radius.circular(0),
                topLeft: const Radius.circular(0)),
          ),
          child: Row(
            children: [
              audioPlayerProvider.song!.artwork != null
                  ? CircleAvatar(
                      backgroundImage:
                          MemoryImage(audioPlayerProvider.song!.artwork!),
                      radius: 30,
                    )
                  : const SizedBox.shrink(),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPaddingAll4.vertical),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(audioPlayerProvider.song!.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.style12
                              .copyWith(fontWeight: FontWeight.w600)),
                      StreamBuilder<Duration>(
                          stream: audioPlayerProvider.duration,
                          builder: (context, snapshot) {
                            final duration = snapshot.data ?? Duration.zero;
                            return Text(
                              '${duration.toString().split('.')[0]} / ${audioPlayerProvider.song!.duration.toString().split('.')[0]}',
                              textAlign: TextAlign.start,
                            );
                          }),
                    ],
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
