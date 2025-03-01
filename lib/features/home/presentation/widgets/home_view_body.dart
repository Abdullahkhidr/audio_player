import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/albums_view.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/artists_view.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/folders_view.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/songs_view.dart';
import 'package:listen_to_me/features/home/presentation/widgets/tab_bar_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarWidget(views: [
      SongsView(),
      ArtistsView(),
      AlbumsView(),
      FoldersView(),
    ]);
  }
}
