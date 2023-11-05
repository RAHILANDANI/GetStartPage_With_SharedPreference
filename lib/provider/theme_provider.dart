import 'package:flutter/foundation.dart';
import 'package:stepperwithmap/model/themee.dart';

class themeprovider extends ChangeNotifier {
  themeee themeeee = themeee(isdark: false);
  void changeTheme() {
    themeeee.isdark = !themeeee.isdark;
    notifyListeners();
  }
}
