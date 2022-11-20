import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:travel_buddy/constants/assets_constants.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';
import 'package:travel_buddy/models/ticket_data/ticket_data.dart';
import 'package:travel_buddy/navigator/app_routes.dart';
import 'package:travel_buddy/widgets/background_wrapper/background_wrapper.dart';
import 'package:travel_buddy/widgets/visitor_list_tile/visitor_list_tile.dart';

class VisitorList extends StatelessWidget {
  const VisitorList({Key? key}) : super(key: key);

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
                        'Visitor List',
                        style: TextStyles.h5.semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RawScrollbar(
                  thickness: 3.0,
                  radius: const Radius.circular(12.0),
                  thumbColor: ColorConstants.primary,
                  child: ListView.builder(
                    itemCount: 20,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: VisitorListTile(
                          amount: 1500,
                          mobileNumber: '+91 98765 43210',
                          dateTime: DateTime.parse(
                                  '2022-${(Random().nextInt(12) + 1).toString().padLeft(2, '0')}-${(Random().nextInt(31) + 1).toString().padLeft(2, '0')}T05:49:55.455Z')
                              .toLocal(),
                          ticketNumber: (index + 1) + 10,
                          onTap: () {
                            //todo use actual data
                            RM.navigate.toNamed(
                              AppRoutes.visitorDetails,
                              arguments: TicketData(
                                dateTime:
                                    '2022-${(Random().nextInt(12) + 1).toString().padLeft(2, '0')}-${(Random().nextInt(31) + 1).toString().padLeft(2, '0')}T05:49:55.455Z',
                                adults: 12,
                                kids: 10,
                                amount: 600,
                                isValid: Random().nextBool(),
                                invalidMessage: 'Ticket has already expired',
                                mobileNumber: '+91 98765 43210',
                                place:
                                    'Howrah Bridge, Fairley Place, Kolkata, West Bengal, India',
                                ticketNumber: (index + 1) + 10,
                                transactionId: '12345678910',
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
