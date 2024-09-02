import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FetchSongsUseCase {
  final OnAudioQuery audioQuery;
  final AudioLibraryRepository audioLibraryRepository;
  FetchSongsUseCase(
      {required this.audioQuery, required this.audioLibraryRepository});

  Future<Either<Failure, List<SongEntity>>> execute() async {
    if (await audioQuery.permissionsRequest()) {
      return await audioLibraryRepository.fetchSongs();
    }
    return Left(PermissionFailure());
  }
}
