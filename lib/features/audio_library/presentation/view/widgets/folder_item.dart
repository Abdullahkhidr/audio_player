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
    return ListTile(
      onTap: () {
        GoRouter.of(context).push(AppRouter.folderDetailsView, extra: folderEntity);
      },
      leading: Icon(FontAwesomeIcons.solidFolderClosed,
          color: kPrimaryColor, size: 40),
      title: Text(folderEntity.name,
          maxLines: 1,
          style: TextStyles.style14.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(
          '${folderEntity.numberOfSongs} songs | ${folderEntity.path}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.style12.copyWith(color: kSecondaryColor)),
    );
  }
}
