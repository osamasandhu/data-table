import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueController extends ChangeNotifier {
  int pageNumber = 1;
  int dataFrom = 1;
  int dataTo = 10;

  increment() {
    if (pageNumber < 10) {
      pageNumber++;
    }
    if (dataTo < 100) {
      dataTo = dataTo + 10;
    }
    if (dataFrom < 90) {
      dataFrom = dataFrom + 10;
    }
    notifyListeners();
  }

  decrement() {
    if (pageNumber > 1) {
      pageNumber--;
    }
    if (dataTo > 10) {
      dataTo = dataTo - 10;
    }
    if (dataFrom > 1) {
      dataFrom = dataFrom - 10;
    }
    notifyListeners();

  }

}
