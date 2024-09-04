import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/core/helpers/audio_extractor.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';

class FetchPlaylistsUseCase {
  final AudioExtractor audioExtractor;
  final AudioLibraryRepository audioLibraryRepository;
  FetchPlaylistsUseCase(
      {required this.audioExtractor, required this.audioLibraryRepository});

  Future<Either<Failure, List<PlaylistEntity>>> execute() async {
    return await audioLibraryRepository.fetchPlaylists();

    // return Left(PermissionFailure());
  }
}
