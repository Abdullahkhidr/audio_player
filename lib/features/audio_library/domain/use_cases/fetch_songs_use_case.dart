import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/core/helpers/audio_extractor.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';

class FetchSongsUseCase {
  final AudioExtractor audioExtractor;
  final AudioLibraryRepository audioLibraryRepository;
  FetchSongsUseCase(
      {required this.audioExtractor, required this.audioLibraryRepository});

  Future<Either<Failure, List<SongEntity>>> execute() async {
    return await audioLibraryRepository.fetchSongs();
  }
}
