import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/artist_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_artists_use_case.dart';

class ArtistsProvider extends ChangeNotifier {
  final FetchArtistsUseCase fetchArtistsUseCase;
  List<ArtistEntity> artists = [];
  ArtistsProvider(this.fetchArtistsUseCase);
  Future<void> fetchArtists() async {
    var result = await fetchArtistsUseCase.execute();
    result.fold((l) => print(l.message), (r) => artists = r);
    notifyListeners();
  }
}
