import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/http/api_service.dart';
import 'package:frontend/utils/http/transaction_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../utils/style/colors.dart';
import '../../widgets/small_text.dart';
import '../home/base_page.dart';


class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  late final TransactionModel _transactionModel;

  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: SmallText(
            text: 'Jetzt den angezeigten QR-Code scannen!',
            size: 15,
          ),
          /*actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 30.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(CupertinoIcons.camera_rotate);
                    case CameraFacing.back:
                      return const Icon(CupertinoIcons.camera_rotate);
                  }
                },
              ),
              iconSize: 30.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],*/
        ),
        body: MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) async {
              final String? code = barcode.rawValue;
              debugPrint('Barcode found! $code');
              _transactionModel = TransactionModel(shopTransaction: code);
              final response =
                  await ApiService().fetchTransaction(_transactionModel);

              if (response?.status.toString() == "successful") {
                Get.defaultDialog(
                    title: ":)",
                    middleText: 'Pfandbon erfolgreich übermittelt.',
                    textConfirm: 'OK',
                    confirmTextColor: AppColors.textBackgroundColor,
                    buttonColor: AppColors.highlightColor,
                    onConfirm: () {
                      cameraController.stop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const BasePage();
                        }),
                      );
                    });
              } else {
                debugPrint(response?.status);
                String? error = response?.status;
                Get.defaultDialog(
                    title: ":(",
                    middleText: 'Fehler bei der Übermittlung: $error',
                    textConfirm: 'OK',
                    confirmTextColor: AppColors.textBackgroundColor,
                    buttonColor: AppColors.highlightColor,
                    onConfirm: () {
                      cameraController.stop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const BasePage();
                        }),
                      );
                    });
              }
            }));
  }
}
