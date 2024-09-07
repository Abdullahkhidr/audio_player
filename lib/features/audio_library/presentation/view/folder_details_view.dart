import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/folder_entity.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/custom_details_app_bar.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/folder_actions.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/song_item.dart';

class FolderDetailsView extends StatelessWidget {
  final FolderEntity folderEntity;
  const FolderDetailsView({super.key, required this.folderEntity});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomDetailsAppBar()),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Icon(FontAwesomeIcons.solidFolderClosed,
                    color: kPrimaryColor, size: sizeScreen.height * 0.16),
                SizedBox(height: kPaddingAll8.top),
                Text(folderEntity.name, style: TextStyles.style30),
                SizedBox(height: kPaddingAll4.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${folderEntity.songs.length} Songs',
                        style: TextStyles.style14),
                    Text('\t|\t',
                        style: TextStyles.style14
                            .copyWith(fontWeight: FontWeight.w600)),
                    Text(
                        '${folderEntity.totalDuration.toString().substring(0, folderEntity.totalDuration.toString().indexOf('.'))} Total Duration',
                        style: TextStyles.style14),
                  ],
                ),
                const FolderActions(),
                Padding(
                    padding: kPaddingAll16,
                    child: Divider(
                        height: 1, thickness: 1, color: kTertiaryColor)),
                SizedBox(height: kPaddingAll16.top),
                Container(
                    padding: kPaddingAll20.copyWith(top: 0),
                    alignment: Alignment.centerLeft,
                    child: const Text('Songs', style: TextStyles.style20)),
              ],
            )),
            SliverList.builder(
              itemCount: folderEntity.songs.length,
              itemBuilder: (context, index) =>
                  SongItem(song: folderEntity.songs[index]),
            )
          ],
        ),
      ),
    );
  }
}
