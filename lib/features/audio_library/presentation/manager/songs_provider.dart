import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_songs_use_case.dart';

class SongsProvider extends ChangeNotifier {
  final FetchSongsUseCase fetchSongsUseCase;

  SongsProvider(this.fetchSongsUseCase);

  List<SongEntity> _songs = [];
  SongState _state = SongState.loading;
  SortOption _sortOption = SortOption.name;
  bool _isAscending = true;

  Future<void> fetchSongs() async {
    final songs = await fetchSongsUseCase.execute();
    setSortOption(SortOption.name);
    songs.fold((l) {
      _state = SongState.error;
    }, (r) {
      _songs = r;
      _state = SongState.loaded;
    });
    setSortOption(_sortOption, _isAscending);
    notifyListeners();
  }

  void setSortOption(SortOption sortOption, [bool isAscending = true]) {
    _sortOption = sortOption;
    _isAscending = isAscending;
    switch (sortOption) {
      case SortOption.name:
        _songs.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortOption.duration:
        _songs.sort((a, b) => a.duration.compareTo(b.duration));
        break;
      case SortOption.date_modified:
        _songs.sort((a, b) => a.dateModified.compareTo(b.dateModified));
        break;
      case SortOption.date_added:
        _songs.sort((a, b) => a.dateAdded.compareTo(b.dateAdded));
        break;
      default:
        break;
    }
    if (!isAscending) {
      _songs = _songs.reversed.toList();
    }
    notifyListeners();
  }

  void toggleSortOrder() {
    _isAscending = !_isAscending;
    _songs = _songs.reversed.toList();
    notifyListeners();
  }

  List<SongEntity> get songs => _songs;
  SongState get state => _state;
  SortOption get sortOption => _sortOption;
  bool get isAscending => _isAscending;
}

enum SongState {
  loading,
  loaded,
  error,
}

enum SortOption {
  name,
  duration,
  date_modified,
  date_added,
}
