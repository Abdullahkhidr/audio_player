import 'package:listen_to_me/features/audio_library/domain/entities/playlist_entity.dart';

class PlaylistModel extends PlaylistEntity {
  PlaylistModel(
      {required super.id,
      required super.name,
      required super.playlistId,
      required super.artistId});

  factory PlaylistModel.fromJson(Map<dynamic, dynamic> json) => PlaylistModel(
      id: json['id'],
      name: json['name'],
      playlistId: json['playlistId'],
      artistId: json['artistId']);
}
