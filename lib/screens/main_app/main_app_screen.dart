import 'package:flutter/material.dart';
import 'package:travel_buddy/navigator/navigator.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: myNavigator.routeInformationParser,
      routerDelegate: myNavigator.routerDelegate,
    );
  }
}
