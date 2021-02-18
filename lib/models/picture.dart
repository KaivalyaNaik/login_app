import 'dart:io';

import 'package:flutter/material.dart';

class Picture with ChangeNotifier {
  File picName;
  Picture({@required this.picName});

  storeImage(Picture pickedImage) {
    this.picName = pickedImage.picName;
    notifyListeners();
  }
}
