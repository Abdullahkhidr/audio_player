import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class ArtistEntity extends Equatable {
  final Uint8List? artwork;
  final String name;
  final String id;
  List<SongEntity> songs;

  ArtistEntity({
    required this.name,
    required this.id,
    this.artwork,
    this.songs = const [],
  });

  @override
  List<Object?> get props => [name, id];
}
