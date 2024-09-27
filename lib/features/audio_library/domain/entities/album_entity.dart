import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class AlbumEntity extends Equatable {
  final Uint8List? artwork;
  final String title;
  final String artist;
  final int id;
  List<SongEntity> songs;
  AlbumEntity({
    required this.title,
    required this.artist,
    required this.id,
    this.artwork,
    this.songs = const [],
  });

  @override
  List<Object?> get props => [id, artist];
}
