import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:listen_to_me/core/helpers/audio_extractor.dart';
import 'package:listen_to_me/core/utils/locator.dart';
import 'package:listen_to_me/features/audio_library/data/repositories/audio_library_repository_impl.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_songs_use_case.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/songs_provider.dart';
import 'package:listen_to_me/features/audio_player/presentation/manager/audio_player_provider.dart';
import 'package:listen_to_me/features/audio_player/presentation/view/audio_player_view.dart';
import 'package:listen_to_me/features/home/presentation/home_view.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static const homeView = '/';
  static const audioPlayerView = '/audio-player';

  static final playerProvider =
      AudioPlayerProvider(GetLocator.locator.get<AudioPlayer>());
  static final songsProvider = SongsProvider(FetchSongsUseCase(
      audioExtractor: GetLocator.locator.get<AudioExtractor>(),
      audioLibraryRepository:
          GetLocator.locator.get<AudioLibraryRepositoryImpl>()))
    ..fetchSongs();

  static GoRouter get router => GoRouter(routes: [
        GoRoute(
            path: homeView,
            builder: (context, state) => ChangeNotifierProvider.value(
                value: songsProvider,
                child: HomeView(audioPlayerProvider: playerProvider))),
        GoRoute(
            path: audioPlayerView,
            builder: (context, state) => ChangeNotifierProvider.value(
                value: playerProvider..init((state.extra as SongEntity)),
                child: const AudioPlayerView())),
      ]);
}
