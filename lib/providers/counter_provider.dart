import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void updateCounter(bool isIncrement) {
    if (!isIncrement && counter <= 0) return;
    counter += isIncrement ? 1 : -1;
    notifyListeners();
  }
}
