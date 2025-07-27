import 'package:flutter/material.dart';

class DashBoardNotifier extends ChangeNotifier {
  int _section = 0;
  int get section => _section;

  void updateSection(int index) {
    _section = index;
    notifyListeners();
  }
}
