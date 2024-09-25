import 'package:flutter/material.dart';
import 'package:listen_to_me/features/audio_library/presentation/manager/artists_provider.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/artist_item_widget.dart';
import 'package:listen_to_me/features/audio_library/presentation/view/widgets/custom_artists_app_bar.dart';
import 'package:provider/provider.dart';

class ArtistsView extends StatelessWidget {
  const ArtistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ArtistsProvider>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child:
                CustomArtistsAppBar(title: '${bloc.artists.length} Artists')),
        SliverList.builder(
            itemCount: bloc.artists.length,
            itemBuilder: (context, index) {
              return ArtistItemWidget(artist: bloc.artists[index]);
            })
      ],
    );
  }
}
