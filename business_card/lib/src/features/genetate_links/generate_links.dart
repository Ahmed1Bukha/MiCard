import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../models_classes/auth.dart';

class GenerateLinks {
  convertToImage(Widget widget) async {
    final controller = ScreenshotController();
    final bytes = await controller.captureFromWidget(Material(child: widget));
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/card.png');

    await file.writeAsBytes(bytes);

    final userId = Auth().getUserId();
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${userId}.png');

    await storageRef.putFile(file);
    final imageUrl = await storageRef.getDownloadURL();
    GallerySaver.saveImage(imageUrl);
    print(imageUrl);
  }

  convertToPdf() async {
    final pdf = pw.Document();
    final userId = Auth().getUserId();
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${userId}.png');
    final netImage = await networkImage(storageRef.getDownloadURL().toString());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(netImage),
          ); // Center
        },
      ),
    ); // Page
    final file = File("example.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}
