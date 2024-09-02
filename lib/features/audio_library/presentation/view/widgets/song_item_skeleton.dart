import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SongItemSkeleton extends StatelessWidget {
  const SongItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kPaddingAll4,
      padding: EdgeInsets.symmetric(
          horizontal: kPaddingAll16.left, vertical: kPaddingAll8.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius10,
      ),
      child: Row(
        children: [
          Skeleton.shade(
              child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: kBorderRadius10,
            ),
          )),
          SizedBox(width: kPaddingAll16.left),
          const Skeletonizer(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Title of Music", style: TextStyles.style18),
              Text("Album of Music", style: TextStyles.style14),
            ]),
          ),
          const Spacer(),
          Skeleton.shade(
              child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
          )),
        ],
      ),
    );
  }
}
