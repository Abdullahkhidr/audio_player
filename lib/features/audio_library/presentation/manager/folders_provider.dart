import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/folder_entity.dart';
import 'package:listen_to_me/features/audio_library/domain/use_cases/fetch_folders_use_case.dart';

class FoldersProvider extends ChangeNotifier {
  final FetchFoldersUseCase fetchFoldersUseCase;
  FoldersProvider({required this.fetchFoldersUseCase});

  List<FolderEntity> folders = [];

  Future<void> fetchFolders() async {
    var result = await fetchFoldersUseCase.execute();
    result.fold((l) => null, (r) => folders = r);
    notifyListeners();
  }
}
