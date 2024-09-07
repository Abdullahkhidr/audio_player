import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class FolderEntity {
  final String name;
  final String path;
  final List<SongEntity> songs;

  FolderEntity({
    required this.name,
    required this.path,
    required this.songs,
  }) {
    _calculateTotalDuration();
  }

  Duration _totalDuration = Duration.zero;

  Duration get totalDuration => _totalDuration;

  void _calculateTotalDuration() {
    _totalDuration = Duration.zero;
    for (var song in songs) {
      _totalDuration += song.duration;
    }
  }
}
