import 'package:dartz/dartz.dart';
import 'package:listen_to_me/core/errors/failure.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/artist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/folder_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

abstract class AudioLibraryRepository {
  Future<Either<Failure, List<SongEntity>>> fetchSongs();
  Future<Either<Failure, List<AlbumEntity>>> fetchAlbums();
  Future<Either<Failure, List<ArtistEntity>>> fetchArtists();
  Future<Either<Failure, List<PlaylistEntity>>> fetchPlaylists();
  Future<Either<Failure, List<FolderEntity>>> fetchFolders();
}
