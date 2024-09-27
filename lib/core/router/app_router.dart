import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:listen_to_me/core/helpers/audio_extractor.dart';
import 'package:listen_to_me/core/utils/locator.dart';
import 'package:listen_to_me/features/audio_library/data/repositories/audio_library_repository_impl.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_albums_use_case.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_artists_use_case.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_folders_use_case.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_songs_use_case.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/albums_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/artists_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/folders_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/songs_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/group_of_songs_view.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';
import 'package:listen_to_me/features/audio_player/presentation/view/audio_player_view.dart';
import 'package:listen_to_me/features/home/presentation/home_view.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static const homeView = '/';
  static const audioPlayerView = '/audio-player';
  static const groupOfSongsView = '/group-of-songs';

  static final playerProvider =
      AudioPlayerProvider(GetLocator.locator.get<AudioPlayer>());

  static final foldersProvider = FoldersProvider(
      fetchFoldersUseCase: FetchFoldersUseCase(
          audioLibraryRepository:
              GetLocator.locator.get<AudioLibraryRepositoryImpl>()));

  static final artistsProvider = ArtistsProvider(FetchArtistsUseCase(
      audioLibraryRepository:
          GetLocator.locator.get<AudioLibraryRepositoryImpl>(),
      audioExtractor: GetLocator.locator.get<AudioExtractor>()));

  static final albumsProvider = AlbumsProvider(FetchAlbumsUseCase(
      audioExtractor: GetLocator.locator.get<AudioExtractor>(),
      audioLibraryRepository:
          GetLocator.locator.get<AudioLibraryRepositoryImpl>()));

  static final songsProvider = SongsProvider(FetchSongsUseCase(
      audioExtractor: GetLocator.locator.get<AudioExtractor>(),
      audioLibraryRepository:
          GetLocator.locator.get<AudioLibraryRepositoryImpl>()))
    ..fetchSongs().then((value) {
      foldersProvider.fetchFolders();
      artistsProvider.fetchArtists();
      albumsProvider.fetchAlbums();
    });

  static GoRouter get router => GoRouter(routes: [
        GoRoute(
            path: homeView,
            builder: (context, state) => MultiProvider(providers: [
                  ChangeNotifierProvider.value(value: songsProvider),
                  ChangeNotifierProvider.value(value: artistsProvider),
                  ChangeNotifierProvider.value(value: albumsProvider),
                  ChangeNotifierProvider.value(value: foldersProvider),
                ], child: HomeView(audioPlayerProvider: playerProvider))),
        GoRoute(
            path: audioPlayerView,
            builder: (context, state) => ChangeNotifierProvider.value(
                value: playerProvider..init((state.extra as SongEntity)),
                child: const AudioPlayerView())),
        GoRoute(
            path: groupOfSongsView,
            builder: (context, state) => GroupOfSongsView(
                cover: (state.extra as Map)['cover'] as Widget,
                title: (state.extra as Map)['title'] as String,
                totalDuration:
                    (state.extra as Map)['totalDuration'] as Duration,
                songs: (state.extra as Map)['songs'] as List<SongEntity>)),
      ]);
}
