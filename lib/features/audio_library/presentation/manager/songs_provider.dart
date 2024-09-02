import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_songs_use_case.dart';

class SongsProvider extends ChangeNotifier {
  final FetchSongsUseCase fetchSongsUseCase;

  SongsProvider(this.fetchSongsUseCase);

  List<SongEntity> _songs = [];

  Future<void> fetchSongs() async {
    final songs = await fetchSongsUseCase.execute();
    songs.fold((l) => null, (r) => _songs = r);
    notifyListeners();
  }

  List<SongEntity> get songs => _songs;
}
