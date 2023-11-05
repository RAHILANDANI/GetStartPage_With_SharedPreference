import 'package:flutter/material.dart';
import 'package:stepperwithmap/model/counter.dart';

class counterprovider extends ChangeNotifier {
  counter Counter = counter(count: 0);
  void increament() {
    Counter.count++;
    notifyListeners();
  }

  void decreament() {
    Counter.count--;
    notifyListeners();
  }
}
