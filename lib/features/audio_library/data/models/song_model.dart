import 'dart:typed_data';

import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  SongModel({
    required super.title,
    required super.artist,
    required super.album,
    required super.path,
    required super.duration,
    required super.id,
    required super.albumId,
    required super.artistId,
    required super.dateAdded,
    required super.dateModified,
    required super.fileExtension,
    required super.artwork,
  });

  factory SongModel.fromJson(Map<dynamic, dynamic> json, Uint8List? artwork) =>
      SongModel(
          title: json['_display_name'],
          artist: json['artist'] ?? '',
          album: json['album'] ?? '',
          path: json['_data'] ?? '',
          duration: Duration(milliseconds: json['duration'] ?? 0),
          id: json['_id'],
          albumId: json['album_id'],
          artistId: json['artist_id'],
          dateAdded: DateTime.fromMillisecondsSinceEpoch(json['date_added']),
          dateModified:
              DateTime.fromMillisecondsSinceEpoch(json['date_modified']),
          fileExtension: json['file_extension'],
          artwork: artwork);
}
