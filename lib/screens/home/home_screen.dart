import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:travel_buddy/constants/assets_constants.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';
import 'package:travel_buddy/navigator/app_routes.dart';
import 'package:travel_buddy/screens/login/store/login_screen_store.dart';
import 'package:travel_buddy/widgets/background_wrapper/background_wrapper.dart';
import 'package:travel_buddy/widgets/buttons/large_icon_button/large_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWrapper(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Good Afternoon',
                          style: TextStyles.h5.semiBold,
                        ),
                        Text(
                          'johndow@gmail.com',
                          style: TextStyles.h6.semiBold.copyWith(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //todo
                      print('Logout');
                      RM.navigate.toNamedAndRemoveUntil(AppRoutes.loginScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      backgroundColor: ColorConstants.primary,
                      minimumSize: const Size(42.0, 42.0),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: SvgPicture.asset(
                      AssetsConstants.logoutIcon,
                      color: Colors.white,
                      height: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LargeIconButton(
                    onPressed: () {
                      //todo
                      print('Navigate to Scan QR');
                      RM.navigate.toNamed(
                        AppRoutes.qrScanningScreen,
                      );
                    },
                    svgIcon: AssetsConstants.scanQr,
                    label: 'Scan QR',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: LargeIconButton(
                      //todo
                      onPressed: () {
                        print('Navigate to Visitor Data');
                        RM.navigate.toNamed(
                          AppRoutes.visitorList,
                        );
                      },
                      svgIcon: AssetsConstants.visitorData,
                      label: 'Visitor Data',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
