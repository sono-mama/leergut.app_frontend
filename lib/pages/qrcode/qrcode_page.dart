import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../widgets/small_text.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {


  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, elevation: 0.0,
          title: SmallText(text: 'Jetzt den angezeigten QR-Code scannen!', size: 15,),
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
            onDetect: (barcode, args) {
              final String? code = barcode.rawValue;
              debugPrint('Barcode found! $code');
            }));
  }
}