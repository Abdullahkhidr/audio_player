import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer;

  AudioPlayerProvider(this._audioPlayer);

  AudioPlayer get audioPlayer => _audioPlayer;
  late SongEntity _song;
  SongEntity get song => _song;

  void init(SongEntity song) {
    try {
      if (_song != song) {
        _init(song);
      }
    } catch (e) {
      _init(song);
    }
  }

  void _init(SongEntity song) {
    _audioPlayer.setFilePath(song.path);
    _song = song;
    _audioPlayer.play();
  }

  bool get isPlaying => _audioPlayer.playing;

  void seekForward() {
    _audioPlayer.seek(Duration(
        seconds: min(_audioPlayer.position.inSeconds + 10,
            _audioPlayer.duration?.inSeconds ?? 0)));
  }

  void seekBackward() {
    _audioPlayer
        .seek(Duration(seconds: max(0, _audioPlayer.position.inSeconds - 10)));
  }

  void togglePlay() {
    if (isPlaying) {
      pause();
    } else {
      play();
    }
    notifyListeners();
  }

  void seek(Duration duration) {
    _audioPlayer.seek(duration);
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }
}
