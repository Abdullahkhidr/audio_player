import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final bool isSecondary;
  final Function() onPressed;
  final String text;
  final EdgeInsetsGeometry? margin;
  const CustomButton({
    super.key,
    this.icon,
    required this.onPressed,
    required this.text,
    this.margin,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? kPaddingAll8,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor.withOpacity(isSecondary ? 0.2 : 1),
              padding: kPaddingAll16),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(icon,
                      color: isSecondary ? kPrimaryColor : kOnPrimaryColor)
                  : const SizedBox(),
              SizedBox(width: kPaddingAll8.left),
              Text(text,
                  style: TextStyles.style18.copyWith(
                      color: isSecondary ? kPrimaryColor : kOnPrimaryColor,
                      fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}
