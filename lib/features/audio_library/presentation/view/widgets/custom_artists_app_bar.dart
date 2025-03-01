import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';

class CustomArtistsAppBar extends StatelessWidget {
  final String title;
  const CustomArtistsAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll20.copyWith(bottom: 2),
      child: Text(title, style: TextStyles.style20),
    );
  }
}
