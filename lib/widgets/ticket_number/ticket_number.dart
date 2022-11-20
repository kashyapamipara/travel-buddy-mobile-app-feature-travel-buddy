import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_buddy/constants/assets_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';

class TicketNumber extends StatelessWidget {
  final String ticketNo;
  final bool showAvatar;
  final double fontSize;
  final double ticketSize;

  const TicketNumber({
    Key? key,
    required this.ticketNo,
    this.showAvatar = false,
    this.fontSize = 18.0,
    this.ticketSize = 34.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AssetsConstants.ticketIcon,
          height: ticketSize,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(
                ticketNo,
                style: TextStyles.h5.semiBold.copyWith(
                  fontSize: fontSize,
                ),
              ),
            ),
            if (showAvatar)
              SvgPicture.asset(
                AssetsConstants.userIcon,
                height: 16.0,
              ),
          ],
        ),
      ],
    );
  }
}
