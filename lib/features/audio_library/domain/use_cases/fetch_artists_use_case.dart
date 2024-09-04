import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/core/helpers/audio_extractor.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/artist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';

class FetchArtistsUseCase {
  final AudioExtractor audioExtractor;
  final AudioLibraryRepository audioLibraryRepository;
  FetchArtistsUseCase(
      {required this.audioExtractor, required this.audioLibraryRepository});

  Future<Either<Failure, List<ArtistEntity>>> execute() async {
    // if (await audioExtractor.permissionsRequest()) {
    return await audioLibraryRepository.fetchArtists();
    // }
    // return Left(PermissionFailure());
  }
}
