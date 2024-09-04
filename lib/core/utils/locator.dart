import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:listen_to_me/core/helpers/audio_extractor.dart';
import 'package:listen_to_me/features/audio_library/data/data_source/local_data_source_impl.dart';
import 'package:listen_to_me/features/audio_library/data/repositories/audio_library_repository_impl.dart';

abstract class GetLocator {
  static late final GetIt locator;

  static void setup() {
    locator = GetIt.instance;
    locator.registerSingleton(AudioPlayer());
    locator.registerSingleton(AudioExtractor());
    locator.registerSingleton(AudioLibraryRepositoryImpl(
        localDataSource: LocalDataSourceImpl(
            audioExtractor: locator.get<AudioExtractor>())));
  }
}
