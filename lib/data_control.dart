import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueController extends ChangeNotifier {
  int pageNumber = 1;
  int dataFrom = 1;
  int dataTo = 10;

  increment() {
    if (pageNumber < 10 && dataTo < 100 && dataFrom < 90) {
      pageNumber++;
      dataFrom = dataFrom + 10;
      dataTo = dataTo + 10;
      notifyListeners();
    }
  }

  decrement() {
    if (pageNumber > 1 && dataTo > 10 && dataFrom > 1) {
      pageNumber--;
      dataTo = dataTo - 10;
      dataFrom = dataFrom - 10;
      notifyListeners();
    }
  }
}
