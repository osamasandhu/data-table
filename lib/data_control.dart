import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueController extends ChangeNotifier {
  int pageNumber = 1;
  int dataRowFrom = 1;
  int dataRowTo = 10;

  increment() {
    if (pageNumber < 10 && dataRowTo < 100 && dataRowFrom < 90) {
      pageNumber++;
      dataRowFrom = dataRowFrom + 10;
      dataRowTo = dataRowTo + 10;
      notifyListeners();
    }
  }

  decrement() {
    if (pageNumber > 1 && dataRowTo > 10 && dataRowFrom > 1) {
      pageNumber--;
      dataRowTo = dataRowTo - 10;
      dataRowFrom = dataRowFrom - 10;
      notifyListeners();
    }
  }
}
