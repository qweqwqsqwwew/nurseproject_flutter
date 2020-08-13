import 'package:flutter/material.dart';

class homeBannerData with ChangeNotifier {

  var imageData = [];

  void setda(List imageData){
    this.imageData = imageData;
    notifyListeners();
  }
}