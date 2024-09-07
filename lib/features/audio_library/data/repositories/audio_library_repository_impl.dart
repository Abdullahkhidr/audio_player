import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/core/utils/cache_data.dart';
import 'package:listen_to_me/features/audio_library/data/data_source/local_data_source.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/artist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/folder_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/repositories/audio_library_repository.dart';

class AudioLibraryRepositoryImpl implements AudioLibraryRepository {
  final LocalDataSource localDataSource;
  AudioLibraryRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<AlbumEntity>>> fetchAlbums() async {
    try {
      return right(await localDataSource.fetchAlbums());
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<ArtistEntity>>> fetchArtists() async {
    try {
      return right(await localDataSource.fetchArtists());
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<PlaylistEntity>>> fetchPlaylists() async {
    try {
      return right(await localDataSource.fetchPlaylists());
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<SongEntity>>> fetchSongs() async {
    try {
      return right(await localDataSource.fetchSongs());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> fetchFolders() async {
    try {
      var songs = CacheData.songs
          .map((e) => e.path.substring(0, e.path.lastIndexOf('/')))
          .toSet()
          .map((e) => FolderEntity(
              name: e.split('/').last,
              path: e,
              songs: CacheData.songs
                  .where((element) => element.path.startsWith(e))
                  .toList()));
      return right(songs.toList());
    } catch (e) {
      return left(Failure());
    }
  }
}
