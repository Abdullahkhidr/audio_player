import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_albums_use_case.dart';

class AlbumsProvider extends ChangeNotifier {
  final FetchAlbumsUseCase fetchAlbumsUseCase;

  AlbumsProvider(this.fetchAlbumsUseCase);

  List<AlbumEntity> albums = [];

  Future<void> fetchAlbums() async {
    var result = await fetchAlbumsUseCase();
    result.fold((failure) {
      print(failure.toString());
    }, (value) {
      albums = value;
    });
    notifyListeners();
  }
}
