import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:travel_buddy/constants/assets_constants.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';
import 'package:travel_buddy/navigator/app_routes.dart';
import 'package:travel_buddy/widgets/background_wrapper/background_wrapper.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWrapper(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsConstants.thankYouIllustrate,
                height: 300.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'Thank you',
                  style: TextStyles.h1.semiBold.copyWith(
                    color: ColorConstants.primary,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  RM.navigate.backUntil(AppRoutes.home);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.primary,
                  minimumSize: const Size.fromHeight(56.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SvgPicture.asset(
                        AssetsConstants.backIcon,
                        height: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Go to Main menu',
                      style: TextStyles.h5.semiBold.copyWith(
                        color: Colors.white,
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
