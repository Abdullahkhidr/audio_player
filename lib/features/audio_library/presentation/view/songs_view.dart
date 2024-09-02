import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/songs_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_library_app_bar.dart';
import 'widgets/song_item.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = context.watch<SongsProvider>().songs;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomLibraryAppBar(title: '${songs.length} Songs')),
        SliverList.builder(
            itemBuilder: (context, index) => SongItem(song: songs[index]),
            itemCount: songs.length),
      ],
    );
  }
}
