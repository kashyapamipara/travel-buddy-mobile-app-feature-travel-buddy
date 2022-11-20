import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/screens/main_app/main_app_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Todo It Only allows Vertical screen orientation (The Code for horizontal screen is not handled)
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorConstants.primary,
  ));
  runApp(const MainAppScreen());
}
