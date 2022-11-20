import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_buddy/constants/assets_constants.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';

class LargeIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final String svgIcon;

  const LargeIconButton({
    Key? key,
    this.onPressed,
    required this.label,
    required this.svgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        backgroundColor: ColorConstants.primary,
        minimumSize: const Size(190.0, 236.0),
        padding: const EdgeInsets.all(10.0),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            svgIcon,
            color: Colors.white,
            height: 136.0,
          ),
          Text(
            label,
            style: TextStyles.h4.semiBold,
          ),
        ],
      ),
    );
  }
}
