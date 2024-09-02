import 'package:listen_to_me/features/audio_library/domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity {
  ArtistModel(
      {required super.id,
      required super.name,
      required super.albumId,
      required super.artistId});

  factory ArtistModel.fromJson(Map<dynamic, dynamic> json) => ArtistModel(
      id: json['id'],
      name: json['name'],
      albumId: json['albumId'],
      artistId: json['artistId']);
}
