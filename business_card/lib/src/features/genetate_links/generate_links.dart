import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

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
}
