import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/scr/state_management/state_management.dart';
import 'package:travel_buddy/constants/assets_constants.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';
import 'package:travel_buddy/models/ticket_data/ticket_data.dart';
import 'package:travel_buddy/widgets/background_wrapper/background_wrapper.dart';
import 'package:travel_buddy/widgets/ticket_number/ticket_number.dart';
import 'package:travel_buddy/widgets/ticket_painter/ticket_painter.dart';

class VisitorDetailsScreen extends StatelessWidget {
  final TicketData ticketData;

  const VisitorDetailsScreen({
    Key? key,
    required this.ticketData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWrapper(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: ColorConstants.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(18.0),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    IconButton(
                      onPressed: () {
                        RM.navigate.back();
                      },
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 28.0,
                      icon: SvgPicture.asset(
                        AssetsConstants.backIcon,
                        color: Colors.white,
                        height: 28.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Visitor Details',
                        style: TextStyles.h5.semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  children: [
                    SvgPicture.asset(
                      AssetsConstants.familyIcon,
                      height: 240.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('d MMM yyyy - hh:mm a').format(
                            DateTime.parse(ticketData.dateTime!).toLocal()),
                        style: TextStyles.h5.semiBold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ClipPath(
                        clipper: TicketClipper(),
                        child: Container(
                          color: Colors.white,
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return CustomPaint(
                                size: Size(constraints.maxWidth,
                                    constraints.maxHeight),
                                painter: TicketPainter(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          32.0, 16.0, 32.0, 0.0),
                                      child: Text(
                                        ticketData.mobileNumber ??
                                            '+91 98765 43210',
                                        style: TextStyles.h3.semiBold.copyWith(
                                          color: ColorConstants.primary,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                      child: TicketNumber(
                                        ticketNo:
                                            ticketData.ticketNumber.toString(),
                                        ticketSize: 44.0,
                                        fontSize: 32.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 6.0),
                                            child: SvgPicture.asset(
                                              AssetsConstants.kidsIcon,
                                              height: 42.0,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Kids',
                                                style: TextStyles.body.semiBold,
                                              ),
                                              Text(
                                                ticketData.kids.toString(),
                                                style: TextStyles.h4.semiBold,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 6.0,
                                              left: 24.0,
                                            ),
                                            child: SvgPicture.asset(
                                              AssetsConstants.adultsIcon,
                                              height: 42.0,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Adults',
                                                style: TextStyles.body.semiBold,
                                              ),
                                              Text(
                                                ticketData.adults.toString(),
                                                style: TextStyles.h4.semiBold,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Transaction ID',
                                                style: TextStyles.h6.semiBold
                                                    .copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              Text(
                                                ticketData.transactionId ??
                                                    '12345678910',
                                                style: TextStyles.h5.semiBold,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amount',
                                                style: TextStyles.h6.semiBold
                                                    .copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              Text(
                                                '₹${ticketData.amount.toString()}',
                                                style: TextStyles.h5.semiBold,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(top: 24.0),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                        horizontal: 32.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstants.grey
                                            .withOpacity(0.04),
                                      ),
                                      child: Text(
                                        ticketData.place ??
                                            'Howrah Bridge, Fairley Place, Kolkata, West Bengal, India',
                                        style: TextStyles.h6.semiBold.copyWith(
                                          color: Colors.black.withOpacity(0.5),
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
                    ),
                    //todo remove this invalid messages if no necessary
                    if (ticketData.isValid == false)
                      Container(
                        margin: const EdgeInsets.only(bottom: 18.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstants.lightRed,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: SvgPicture.asset(
                                AssetsConstants.invalidIcon,
                                height: 24.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Invalid Ticket',
                              style: TextStyles.h5.semiBold,
                            ),
                          ],
                        ),
                      ),
                    if (ticketData.isValid == false &&
                        ticketData.invalidMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Text(
                          ticketData.invalidMessage ??
                              'Ticket has already expired',
                          style: TextStyles.h5.semiBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
