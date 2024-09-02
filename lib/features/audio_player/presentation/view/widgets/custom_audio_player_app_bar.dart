import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';

class CustomMusicPlayerAppBar extends StatelessWidget {
  const CustomMusicPlayerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPaddingAll20,
        child: Row(
          children: [
            IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(FontAwesomeIcons.arrowLeft)),
          ],
        ),
      ),
    );
  }
}
