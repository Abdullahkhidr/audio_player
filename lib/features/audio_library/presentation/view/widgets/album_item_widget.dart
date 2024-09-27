import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/router/app_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/album_entity.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/song_item_image.dart';

class AlbumItemWidget extends StatelessWidget {
  final AlbumEntity album;
  const AlbumItemWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    const double width = 180;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.groupOfSongsView, extra: {
          'cover': SongItemImage(
              size: width / 1.2,
              image: album.artwork,
              borderRadius: kBorderRadius10),
          'title': album.title,
          'totalDuration': album.songs.fold(const Duration(seconds: 0),
              (value, element) => value + element.duration),
          'songs': album.songs,
        });
      },
      child: Container(
          width: width,
          padding: kPaddingAll16,
          margin: kPaddingAll4,
          decoration: BoxDecoration(
            borderRadius: kBorderRadius10,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 4,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SongItemImage(
                  size: width / 1.2,
                  image: album.artwork,
                  borderRadius: kBorderRadius10),
              SizedBox(height: kPaddingAll4.vertical),
              Text(album.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyles.style14.copyWith(fontWeight: FontWeight.w600)),
              SizedBox(height: kPaddingAll4.top),
              Text(album.artist, maxLines: 1, style: TextStyles.style14),
              Text("${album.songs.length} songs",
                  maxLines: 1, style: TextStyles.style14),
            ],
          )),
    );
  }
}
