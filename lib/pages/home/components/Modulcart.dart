

import 'package:flutter/cupertino.dart';

import '../../../AppData.dart';

class MainModel extends ChangeNotifier {
  int _yukseklik = 0;

  int get totalyukseklik => _yukseklik;

  set totalyukseklik(int value) {
    if (AppData.yuksekliktotal < AppData.maxyukseklik){

    notifyListeners();

  }
  }
}