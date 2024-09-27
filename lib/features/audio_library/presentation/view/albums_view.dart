import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/albums_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/album_item_widget.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/custom_albums_app_bar.dart';
import 'package:provider/provider.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AlbumsProvider>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomAlbumsAppBar(title: '${bloc.albums.length} Albums')),
        SliverToBoxAdapter(
          child: Wrap(
            runAlignment: WrapAlignment.spaceEvenly,
            alignment: WrapAlignment.center,
            children:
                bloc.albums.map((e) => AlbumItemWidget(album: e)).toList(),
          ),
        ),
      ],
    );
  }
}
