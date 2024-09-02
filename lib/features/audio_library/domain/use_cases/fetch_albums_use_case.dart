import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FetchAlbumsUseCase {
  final OnAudioQuery audioQuery;
  final AudioLibraryRepository audioLibraryRepository;
  FetchAlbumsUseCase(
      {required this.audioQuery, required this.audioLibraryRepository});

  Future<Either<Failure, List<AlbumEntity>>> execute() async {
    if (await audioQuery.permissionsRequest()) {
      return await audioLibraryRepository.fetchAlbums();
    }
    return Left(PermissionFailure());
  }
}
