import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_songs_use_case.dart';

class SongsProvider extends ChangeNotifier {
  final FetchSongsUseCase fetchSongsUseCase;

  SongsProvider(this.fetchSongsUseCase);

  List<SongEntity> _songs = [];
  SongState _state = SongState.loading;
  Future<void> fetchSongs() async {
    final songs = await fetchSongsUseCase.execute();
    songs.fold((l) {
      _state = SongState.error;
    }, (r) {
      _songs = r;
      _state = SongState.loaded;
    });
    notifyListeners();
  }

  List<SongEntity> get songs => _songs;
  SongState get state => _state;
}

enum SongState {
  loading,
  loaded,
  error,
}
