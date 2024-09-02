import 'package:get_it/get_it.dart';
import 'package:listen_to_me/features/audio_library/data/data_source/local_data_source_impl.dart';
import 'package:listen_to_me/features/audio_library/data/repositories/audio_library_repository_impl.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class GetLocator {
  static late final GetIt locator;

  static void setup() {
    locator = GetIt.instance;
    locator.registerSingleton(OnAudioQuery());
    locator.registerSingleton(AudioLibraryRepositoryImpl(
        localDataSource:
            LocalDataSourceImpl(audioQuery: locator.get<OnAudioQuery>())));
  }
}
