import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/folders_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/custom_songs_app_bar.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/folder_item.dart';
import 'package:provider/provider.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({super.key});

  @override
  Widget build(BuildContext context) {
    final folders = context.watch<FoldersProvider>().folders;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomSongsAppBar(title: '${folders.length} Folders')),
        SliverList.builder(
            itemCount: folders.length,
            itemBuilder: (context, index) {
              return FolderItem(folderEntity: folders[index]);
            })
      ],
    );
  }
}
