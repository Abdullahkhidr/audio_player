import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/router/app_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/artist_entity.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/song_item_image.dart';

class ArtistItemWidget extends StatelessWidget {
  final ArtistEntity artist;
  const ArtistItemWidget({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.groupOfSongsView, extra: {
          'cover': SongItemImage(
              size: 180, image: artist.artwork, borderRadius: kBorderRadius10),
          'title': artist.name,
          'totalDuration': artist.songs.fold(const Duration(seconds: 0),
              (value, element) => value + element.duration),
          'songs': artist.songs,
        });
      },
      child: Container(
        margin: kPaddingAll4,
        padding: EdgeInsets.symmetric(
            horizontal: kPaddingAll16.left, vertical: kPaddingAll8.bottom),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kBorderRadius10,
        ),
        child: Row(
          children: [
            SongItemImage(image: artist.artwork, borderRadius: kBorderRadius50),
            SizedBox(width: kPaddingAll16.left),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(artist.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.style14
                        .copyWith(fontWeight: FontWeight.w600)),
                SizedBox(height: kPaddingAll4.top),
                Text("${artist.songs.length} songs",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.style14)
              ],
            )),
            SizedBox(width: kPaddingAll16.right),
          ],
        ),
      ),
    );
  }
}
