import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/songs_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_library_app_bar.dart';
import 'widgets/song_item.dart';
import 'widgets/song_item_skeleton.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = context.watch<SongsProvider>().songs;
    final state = context.watch<SongsProvider>().state;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomSongsAppBar(title: '${songs.length} Songs')),
        SliverList.builder(
            itemBuilder: (context, index) => state == SongState.loading
                ? const SongItemSkeleton()
                : SongItem(song: songs[index]),
            itemCount: state == SongState.loading ? 10 : songs.length),
      ],
    );
  }
}
