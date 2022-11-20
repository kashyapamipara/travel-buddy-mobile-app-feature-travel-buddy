import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:travel_buddy/constants/color_constants.dart';

class LoadingDialog extends StatelessWidget {
  final Color? backgroundColor;
  final String? infoText;

  const LoadingDialog({
    Key? key,
    this.backgroundColor,
    this.infoText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              color: ColorConstants.grey,
              blurRadius: 1.0,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              ColorConstants.primary,
            ),
          ),
        ),
      ),
    );
  }
}

void showLoadingIndicatorDialog({Color? backgroundColor}) {
  showDialog(
    context: RM.context!,
    barrierDismissible: false,
    builder: (context) {
      return LoadingDialog(
        backgroundColor: backgroundColor,
      );
    },
  );
}

void hideLoadingIndicatorDialog() {
  if (RM.navigate.navigatorState.canPop()) {
    RM.navigate.back();
  }
}
