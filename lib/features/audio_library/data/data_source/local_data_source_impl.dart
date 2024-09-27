import 'package:listen_to_me/core/helpers/audio_extractor.dart';
import 'package:listen_to_me/core/utils/cache_data.dart';
import 'package:listen_to_me/features/audio_library/data/data_source/local_data_source.dart';
import 'package:listen_to_me/features/audio_library/data/models/playlist_model.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/data/models/song_model.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final AudioExtractor audioExtractor;
  LocalDataSourceImpl({required this.audioExtractor});

  @override
  Future<List<SongEntity>> fetchSongs() async {
    List<SongEntity> result = (await audioExtractor.getSongs())
        .map((e) => SongModel.fromMap(e))
        .toList();
    CacheData.songs = result;
    return result;
  }

  @override
  Future<List<PlaylistEntity>> fetchPlaylists() async {
    var playlists = await audioExtractor.getPlaylists();
    return playlists.map((e) => PlaylistModel.fromJson(e)).toList();
  }
}
