import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer;

  SongEntity? _song;

  AudioPlayerProvider(this._audioPlayer);

  AudioPlayer get audioPlayer => _audioPlayer;
  SongEntity? get song => _song;
  bool get isLooping => _audioPlayer.loopMode == LoopMode.one;
  Stream<bool> get isPlaying => _audioPlayer.playingStream;
  Stream<Duration> get duration => _audioPlayer.positionStream;
  double get volume => _audioPlayer.volume;
  double get speed => _audioPlayer.speed;
  List<double> get speeds => [1, 1.25, 1.5, 2];

  void init(SongEntity song) {
    if (_song != song) {
      _initialize(song);
    }
  }

  void _initialize(SongEntity song) {
    _audioPlayer.setFilePath(song.path);
    _song = song;
    _audioPlayer.play();
  }

  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  Future<void> setSpeed(double speed) async {
    await _audioPlayer.setSpeed(speed);
  }

  Future<void> toggleLoopMode() async {
    await _audioPlayer.setLoopMode(
        _audioPlayer.loopMode == LoopMode.one ? LoopMode.off : LoopMode.one);
    notifyListeners();
  }

  Future<void> toggleVolume() async {
    await _audioPlayer.setVolume(1 - _audioPlayer.volume);
    notifyListeners();
  }

  Future<void> toggleSpeed() async {
    await _audioPlayer
        .setSpeed(speeds[(speeds.indexOf(speed) + 1) % speeds.length]);
    notifyListeners();
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    notifyListeners();
  }

  void togglePlay() {
    if (_audioPlayer.playing) {
      pause();
    } else {
      play();
    }
    notifyListeners();
  }

  Future<void> seek(Duration duration) async {
    await _audioPlayer.seek(duration);
  }

  Future<void> seekForward() async {
    await _audioPlayer.seek(Duration(
        seconds: min(_audioPlayer.position.inSeconds + 10,
            _audioPlayer.duration?.inSeconds ?? 0)));
  }

  Future<void> seekBackward() async {
    await _audioPlayer
        .seek(Duration(seconds: max(0, _audioPlayer.position.inSeconds - 10)));
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }
}
