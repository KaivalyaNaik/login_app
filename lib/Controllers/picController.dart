import 'package:flutter/widgets.dart';
import 'package:login_app/models/picture.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'authController.dart';
import 'dart:io';

class PicController {
  Future<void> getImage(BuildContext context) async {
    Reference defaultImage = FirebaseStorage.instance.ref('/default.png');
    try {
      Reference storage = FirebaseStorage.instance
          .ref("/images/${AuthController.firebaseUser.uid}.jpeg");

      Directory appDir = await getApplicationDocumentsDirectory();
      File file =
          File('${appDir.path}/${AuthController.firebaseUser.uid}.jpeg');
      await storage.writeToFile(file);

      Picture picture = Picture(picName: file);
      Provider.of<Picture>(context, listen: false).storeImage(picture);
    } catch (e) {
      Directory appDir = await getApplicationDocumentsDirectory();
      File file =
          File('${appDir.path}/${AuthController.firebaseUser.uid}.jpeg');
      try {
        await defaultImage.writeToFile(file);
      } catch (e) {
        print(e.toString());
      }
      Picture picture = Picture(picName: file);
      Provider.of<Picture>(context, listen: false).storeImage(picture);
    }
  }

  Future<void> uploadImage(String filePath) async {
    Reference storage = FirebaseStorage.instance
        .ref("/images/${AuthController.firebaseUser.uid}.jpeg");

    Reference defaultImage = FirebaseStorage.instance.ref('/default.png');
    File file = File(filePath);
    try {
      await storage.putFile(file);
    } catch (e) {
      print(e.toString());
    }
  }
}
