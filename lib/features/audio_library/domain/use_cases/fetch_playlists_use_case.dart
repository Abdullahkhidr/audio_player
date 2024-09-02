import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FetchPlaylistsUseCase {
  final OnAudioQuery audioQuery;
  final AudioLibraryRepository audioLibraryRepository;
  FetchPlaylistsUseCase(
      {required this.audioQuery, required this.audioLibraryRepository});

  Future<Either<Failure, List<PlaylistEntity>>> execute() async {
    if (await audioQuery.permissionsRequest()) {
      return await audioLibraryRepository.fetchPlaylists();
    }
    return Left(PermissionFailure());
  }
}