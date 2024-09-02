import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel(
      {required super.title,
      required super.artist,
      required super.album,
      required super.path,
      required super.duration,
      required super.id,
      required super.albumId,
      required super.artistId});

  factory AlbumModel.fromJson(Map<dynamic, dynamic> json) => AlbumModel(
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      path: json['path'],
      duration: json['duration'],
      id: json['id'],
      albumId: json['albumId'],
      artistId: json['artistId']);
}
