import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel(
      {required super.title,
      required super.artist,
      required super.id,
      super.songs});
}
