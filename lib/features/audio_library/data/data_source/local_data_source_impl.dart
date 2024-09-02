import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_library/data/data_source/local_data_source.dart';
import 'package:listen_to_me/features/audio_library/data/models/album_model.dart';
import 'package:listen_to_me/features/audio_library/data/models/artist_model.dart';
import 'package:listen_to_me/features/audio_library/data/models/playlist_model.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/artist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:on_audio_query/on_audio_query.dart' as query;
import 'package:listen_to_me/features/audio_library/data/models/song_model.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final query.OnAudioQuery audioQuery;
  LocalDataSourceImpl({required this.audioQuery});

  @override
  Future<List<SongEntity>> fetchSongs() async {
    var songs = await audioQuery.querySongs();
    return songs
        .map((e) => SongModel.fromJson(e.getMap))
        .where(
            (e) => kAudioFileExtensions.contains(e.fileExtension.toLowerCase()))
        .toList();
  }

  @override
  Future<List<AlbumEntity>> fetchAlbums() async {
    var albums = await audioQuery.queryAlbums();
    return albums.map((e) => AlbumModel.fromJson(e.getMap)).toList();
  }

  @override
  Future<List<ArtistEntity>> fetchArtists() async {
    var artists = await audioQuery.queryArtists();
    return artists.map((e) => ArtistModel.fromJson(e.getMap)).toList();
  }

  @override
  Future<List<PlaylistEntity>> fetchPlaylists() async {
    var playlists = await audioQuery.queryPlaylists();
    return playlists.map((e) => PlaylistModel.fromJson(e.getMap)).toList();
  }
}
