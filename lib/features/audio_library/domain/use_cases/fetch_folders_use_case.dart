import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/folder_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';

class FetchFoldersUseCase {
  final AudioLibraryRepository audioLibraryRepository;

  FetchFoldersUseCase({required this.audioLibraryRepository});

  Future<Either<Failure, List<FolderEntity>>> execute() async {
    return await audioLibraryRepository.fetchFolders();
  }
}
