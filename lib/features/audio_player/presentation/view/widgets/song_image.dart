import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen_to_me/core/utils/assets.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/audio_library/domain/entities/song_entity.dart';

class SongImage extends StatelessWidget {
  final double size;
  final bool isPlaying;
  const SongImage({
    super.key,
    required this.song,
    required this.size,
    this.isPlaying = false,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    if (song.artwork != null) {
      return _SongImage(size: size, song: song, isPlaying: isPlaying);
    } else {
      return _DefaultImage(size: size);
    }
  }
}

class _SongImage extends StatefulWidget {
  const _SongImage({
    required this.size,
    required this.song,
    required this.isPlaying,
  });

  final double size;
  final SongEntity song;
  final bool isPlaying;

  @override
  State<_SongImage> createState() => _SongImageState();
}

class _SongImageState extends State<_SongImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    if (widget.isPlaying) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 5,
                )
              ],
              color: Colors.grey[200],
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: MemoryImage(widget.song.artwork!))),
          child: Container(
              margin: kPaddingAll4,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle))),
    );
  }
}

class _DefaultImage extends StatelessWidget {
  final double size;
  const _DefaultImage({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Padding(
        padding: kPaddingAll8,
        child: SvgPicture.asset(
          Assets.musicIcon,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
