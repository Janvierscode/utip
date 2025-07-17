import 'package:flutter/material.dart';

class UTipProvider with ChangeNotifier {
  int _personCount = 0;
  double _billTotal = 0.0;
  double _tipPercentage = 0;

  int get personCount => _personCount;

  double get billTotal => _billTotal;

  double get tipPercentage => _tipPercentage;

  void updateBillTotal(double billTotal) {
    _billTotal = billTotal;
    notifyListeners();
  }

  void updateTipPercentage(double tipPercentage) {
    _tipPercentage = tipPercentage;
    notifyListeners();
  }

  void updatePersonCount(int personCount) {
    _personCount = personCount;
    notifyListeners();
  }

  double get totalPerPerson =>
      (((_billTotal * _tipPercentage) + _billTotal) / personCount);

  get totalTip => (_billTotal * _tipPercentage);
}
