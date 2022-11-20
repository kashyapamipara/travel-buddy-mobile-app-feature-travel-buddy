import 'package:flutter/material.dart';
import 'package:travel_buddy/constants/assets_constants.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  const BackgroundWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsConstants.backgroundImage,
            ),
            opacity: 0.8,
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
