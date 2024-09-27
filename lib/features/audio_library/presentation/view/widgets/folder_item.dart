import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/router/app_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/folder_entity.dart';

class FolderItem extends StatelessWidget {
  final FolderEntity folderEntity;
  const FolderItem({super.key, required this.folderEntity});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      onTap: () {
        GoRouter.of(context).push(AppRouter.groupOfSongsView, extra: {
          'cover': Icon(FontAwesomeIcons.solidFolderClosed,
              size: size.height * 0.16, color: kPrimaryColor),
          'title': folderEntity.name,
          'totalDuration': folderEntity.songs.fold(const Duration(seconds: 0),
              (value, element) => value + element.duration),
          'songs': folderEntity.songs,
        });
      },
      leading: Icon(FontAwesomeIcons.solidFolderClosed,
          color: kPrimaryColor, size: 40),
      title: Text(folderEntity.name,
          maxLines: 1,
          style: TextStyles.style14.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(
          '${folderEntity.songs.length} songs | ${folderEntity.path}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.style12.copyWith(color: kSecondaryColor)),
    );
  }
}
