import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

abstract class LocalDataSource {
  Future<List<SongEntity>> fetchSongs();
  Future<List<AlbumEntity>> fetchAlbums();
  Future<List<PlaylistEntity>> fetchPlaylists();
}
