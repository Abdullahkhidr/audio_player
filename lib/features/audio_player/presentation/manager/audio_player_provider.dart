import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer;

  late SongEntity _song;

  AudioPlayerProvider(this._audioPlayer);

  AudioPlayer get audioPlayer => _audioPlayer;
  SongEntity get song => _song;
  bool get isLooping => _audioPlayer.loopMode == LoopMode.one;
  bool get isPlaying => _audioPlayer.playing;
  double get volume => _audioPlayer.volume;
  double get speed => _audioPlayer.speed;
  List<double> get speeds => [1, 1.25, 1.5, 2];

  void init(SongEntity song) {
    try {
      if (_song != song) {
        _initialize(song);
      }
    } catch (e) {
      _initialize(song);
    }
  }

  void _initialize(SongEntity song) {
    _audioPlayer.setFilePath(song.path);
    _song = song;
    _audioPlayer.play();
  }

  void setVolume(double volume) {
    _audioPlayer.setVolume(volume);
  }

  void setSpeed(double speed) {
    _audioPlayer.setSpeed(speed);
  }

  void toggleLoopMode() {
    _audioPlayer.setLoopMode(
        _audioPlayer.loopMode == LoopMode.one ? LoopMode.off : LoopMode.one);
    notifyListeners();
  }

  void toggleVolume() {
    _audioPlayer.setVolume(1 - _audioPlayer.volume);
    notifyListeners();
  }

  void toggleSpeed() {
    _audioPlayer.setSpeed(speeds[(speeds.indexOf(speed) + 1) % speeds.length]);
    notifyListeners();
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

  void seekForward() {
    _audioPlayer.seek(Duration(
        seconds: min(_audioPlayer.position.inSeconds + 10,
            _audioPlayer.duration?.inSeconds ?? 0)));
  }

  void seekBackward() {
    _audioPlayer
        .seek(Duration(seconds: max(0, _audioPlayer.position.inSeconds - 10)));
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }
}
