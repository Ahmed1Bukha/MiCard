import 'dart:io';

import 'package:business_card/src/common_widgets/snackbar.dart';
import 'package:business_card/src/constants/text_constants.dart';
import 'package:business_card/src/models_classes/shared.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:go_router/go_router.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({super.key});

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  QRViewController? controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Scan QrCode",
            style: h2.copyWith(color: Colors.white),
          )),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ))
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result?.code);
        Shared().addScannedCard(result!.code);
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar().getSnackBar("Card added"));
      context.go('/home');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
