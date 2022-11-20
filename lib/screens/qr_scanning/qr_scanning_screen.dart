import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/models/ticket_data/ticket_data.dart';
import 'package:travel_buddy/navigator/app_routes.dart';
import 'package:travel_buddy/screens/qr_scanning/store/qr_scanning_store.dart';
import 'package:travel_buddy/widgets/loader/loading_dialog.dart';

class QrScanningScreen extends StatefulWidget {
  const QrScanningScreen({Key? key}) : super(key: key);

  @override
  _QrScanningScreenState createState() => _QrScanningScreenState();
}

class _QrScanningScreenState extends State<QrScanningScreen>
    with SingleTickerProviderStateMixin {
  MobileScannerController controller = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    // facing: CameraFacing.front,
  );

  bool isStarted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                MobileScanner(
                  controller: controller,
                  fit: BoxFit.cover,
                  onDetect: _onDetectCode,
                ),
                Align(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: ColorConstants.primary.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 60,
                    color: Colors.black.withOpacity(0.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          color: Colors.white,
                          icon: ValueListenableBuilder(
                            valueListenable: controller.torchState,
                            builder: (context, state, child) {
                              switch (state) {
                                case TorchState.off:
                                  return const Icon(
                                    Icons.flash_off,
                                    color: Colors.grey,
                                  );
                                case TorchState.on:
                                  return const Icon(
                                    Icons.flash_on,
                                    color: Colors.yellow,
                                  );
                              }
                            },
                          ),
                          iconSize: 32.0,
                          onPressed: () => controller.toggleTorch(),
                        ),
                        IconButton(
                          color: Colors.white,
                          icon: isStarted
                              ? const Icon(Icons.stop)
                              : const Icon(Icons.play_arrow),
                          iconSize: 32.0,
                          onPressed: () => setState(
                            () {
                              isStarted
                                  ? controller.stop()
                                  : controller.start();
                              isStarted = !isStarted;
                            },
                          ),
                        ),
                        IconButton(
                          color: Colors.white,
                          icon: ValueListenableBuilder(
                            valueListenable: controller.cameraFacingState,
                            builder: (context, state, child) {
                              switch (state) {
                                case CameraFacing.front:
                                  return const Icon(Icons.camera_front);
                                case CameraFacing.back:
                                  return const Icon(Icons.camera_rear);
                              }
                            },
                          ),
                          iconSize: 32.0,
                          onPressed: () => controller.switchCamera(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onDetectCode(Barcode barcode, MobileScannerArguments? args) async {
    //todo use this condition if you want to scan only text type qr
    // if (barcode.type == BarcodeType.text && barcode.rawValue != null) {
    if (barcode.rawValue != null) {
      controller.dispose();

      showLoadingIndicatorDialog();

      QrScanningStore qrScanningStore = QrScanningStore();

      final checkListData =
          await qrScanningStore.getTicketDataFromQrToken(barcode.rawValue!);
      hideLoadingIndicatorDialog();
     var tempList1=[...checkListData['data']['itemCheckPoints']];
     // var tempList2=[...checkListData['data']['itemCheckPoints']];

      List tempList2 = tempList1.toList();
      RM.navigate.toReplacementNamed(
        AppRoutes.checkListScreen,
        arguments: [tempList1,checkListData['data']['_id'],{'itemList':tempList2}],
      );
    } else {
      RM.scaffold.showSnackBar(
        SnackBar(
          content: Text('Barcode type ${barcode.type.name} not supported'),
        ),
      );
    }
  }
}
