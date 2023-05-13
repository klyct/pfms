import 'package:flutter/material.dart';

class FlagsProvider with ChangeNotifier {
  int _flagpost = 0;
  getflagpost() => this._flagpost;
  setflagpost(int index) {
    this._flagpost = index;
    notifyListeners();
  }
}
