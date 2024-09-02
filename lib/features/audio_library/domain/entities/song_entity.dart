class SongEntity {
  final String title;
  final String artist;
  final String album;
  final String path;
  final Duration duration;
  final int id;
  final int albumId;
  final int artistId;
  final DateTime dateAdded;
  final DateTime dateModified;
  final String fileExtension;

  SongEntity({
    required this.title,
    required this.artist,
    required this.album,
    required this.path,
    required this.duration,
    required this.id,
    required this.albumId,
    required this.artistId,
    required this.dateAdded,
    required this.dateModified,
    required this.fileExtension,
  });
}
