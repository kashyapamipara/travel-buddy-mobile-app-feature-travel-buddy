import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';
import 'package:travel_buddy/widgets/ticket_number/ticket_number.dart';

class VisitorListTile extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String mobileNumber;
  final DateTime dateTime;
  final int ticketNumber;
  final int amount;

  const VisitorListTile({
    Key? key,
    this.onTap,
    required this.mobileNumber,
    required this.dateTime,
    required this.ticketNumber,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: ColorConstants.grey.withOpacity(0.5),
                blurRadius: 6.0,
                spreadRadius: 0,
                offset: const Offset(0, 0),
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CustomPaint(
                painter: DashedLineInsideContainerPainter(),
                size: Size(constraints.maxWidth, constraints.maxHeight),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                mobileNumber,
                                style: TextStyles.h5.semiBold,
                              ),
                            ),
                            Text(
                              DateFormat('d MMM yyyy - hh:mm a')
                                  .format(dateTime),
                              style: TextStyles.body.semiBold.copyWith(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 4,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 26,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(6.0, 14.0, 16.0, 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: TicketNumber(
                                ticketNo: ticketNumber.toString(),
                                showAvatar: true,
                              ),
                            ),
                            Text(
                              '₹${amount.toString()}',
                              style: TextStyles.h5.semiBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DashedLineInsideContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ColorConstants.lightGrey.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const int dashSize = 6;
    const int gapSize = 6;

    double startY = 0;
    double x = size.width * 0.72;

    while (startY < size.height) {
      // Draw a small line.
      canvas.drawLine(Offset(x, startY), Offset(x, startY + dashSize), paint);

      // Update the starting X
      startY += dashSize + gapSize;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
