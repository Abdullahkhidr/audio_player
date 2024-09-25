import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ArtistEntity extends Equatable {
  final Uint8List? artwork;
  final String name;
  final String id;
  int songsCount;

  ArtistEntity(
      {this.songsCount = 1,
      this.artwork,
      required this.name,
      required this.id});

  @override
  List<Object?> get props => [name, id];
}
