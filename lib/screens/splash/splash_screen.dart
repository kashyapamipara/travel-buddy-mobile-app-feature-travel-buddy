import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/state_management.dart';
import 'package:travel_buddy/constants/assets_constants.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/constants/text_styles.dart';
import 'package:travel_buddy/navigator/app_routes.dart';
import 'package:travel_buddy/widgets/background_wrapper/background_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _initApp();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    sizeAnimation = Tween<double>(begin: 2000.0, end: 340.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    );
    sizeAnimation.addListener(() {
      if (sizeAnimation.value <= 1000) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWrapper(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                AssetsConstants.splashScreenLogo,
                height: sizeAnimation.value,
                fit: BoxFit.fitHeight,
              ),
            ),
            //todo Use this if you want to add title
            // Column(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     const SizedBox(
            //       height: 390.0,
            //     ),
            //     AnimatedOpacity(
            //       opacity: _opacity,
            //       duration: const Duration(seconds: 1),
            //       child: Text(
            //         'বাংলায় স্বাগতম',
            //         style: TextStyles.h1.semiBold.copyWith(
            //           color: ColorConstants.primary,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  void _initApp() async {
    await Future.delayed(const Duration(seconds: 3));
    RM.navigate.toReplacementNamed(AppRoutes.loginScreen);
  }
}
