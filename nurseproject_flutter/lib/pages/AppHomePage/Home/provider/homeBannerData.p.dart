import 'package:flutter/material.dart';

class homeBannerData extends ChangeNotifier {
//  int value = 10;
//  void increment() {
//    value++;
//    notifyListeners();
//  }
//
//  void decrement() {
//    value--;
//    notifyListeners();
//  }

//  void set(int value) {
//    this.value = value;
//  }


  var imageData = [];

  void changeBanner(List imageDat){
    imageData = imageDat;
    notifyListeners();
  }

  void set(List imageData){
    this.imageData = imageData;
  }
}