import 'package:flutter/material.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';

class FullWidthElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? prefixIcon;
  final Color backgroundColor;
  final String text;

  const FullWidthElevatedButton({
    Key? key,
    this.onPressed,
    this.prefixIcon,
    required this.text,
    this.backgroundColor = ColorConstants.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(56.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: prefixIcon,
            ),
          Text(
            text,
            style: TextStyles.h5.semiBold.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
