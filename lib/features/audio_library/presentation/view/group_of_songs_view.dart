import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/custom_details_app_bar.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/folder_actions.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/song_item.dart';

class GroupOfSongsView extends StatelessWidget {
  final Widget cover;
  final String title;
  final Duration totalDuration;
  final List<SongEntity> songs;
  const GroupOfSongsView({
    super.key,
    required this.cover,
    required this.title,
    required this.totalDuration,
    required this.songs,
  });

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
                SizedBox(
                    width: sizeScreen.height * 0.16,
                    child: AspectRatio(aspectRatio: 1, child: cover)),
                SizedBox(height: kPaddingAll8.top),
                Text(title, style: TextStyles.style30),
                SizedBox(height: kPaddingAll4.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${songs.length} Songs', style: TextStyles.style14),
                    Text('\t|\t',
                        style: TextStyles.style14
                            .copyWith(fontWeight: FontWeight.w600)),
                    Text(
                        '${totalDuration.toString().substring(0, totalDuration.toString().indexOf('.'))} Total Duration',
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
              itemCount: songs.length,
              itemBuilder: (context, index) => SongItem(song: songs[index]),
            )
          ],
        ),
      ),
    );
  }
}
