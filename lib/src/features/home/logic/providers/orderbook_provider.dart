import 'dart:async';
import 'dart:math';

import 'package:binance_app_ui/src/features/home/data/models/pat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderBookProvider = ChangeNotifierProvider<OrderBookProvider>((ref) {
  return OrderBookProvider();
});

class OrderBookProvider extends ChangeNotifier {
  Timer? timer;

  List<PATmodel> paTmodels1 = [
    PATmodel(),
    PATmodel(),
    PATmodel(),
    PATmodel(),
    PATmodel(),
  ];
  List<PATmodel> paTmodels2 = [
    PATmodel(),
    PATmodel(),
    PATmodel(),
    PATmodel(),
    PATmodel(),
  ];
  double getRandomDouble(double a, double b) {
    final random = Random();
    return a + (b - a) * random.nextDouble();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      for (var i = 0; i < paTmodels1.length; i++) {
        paTmodels1[i] = paTmodels1[i].copyWith(
          price: double.parse(
              getRandomDouble(30000.12, 37000.12).toStringAsFixed(2)),
          amount: double.parse(
              getRandomDouble(0.700000, 0.799999).toStringAsFixed(6)),
          total: getRandomDouble(21000, 29000),
          gWidth: getRandomDouble(20, 90),
        );
      }
      for (var i = 0; i < paTmodels2.length; i++) {
        paTmodels2[i] = paTmodels2[i].copyWith(
          price: double.parse(
              getRandomDouble(30000.12, 37000.12).toStringAsFixed(2)),
          amount: double.parse(
              getRandomDouble(0.700000, 0.799999).toStringAsFixed(6)),
          total: getRandomDouble(21000, 29000),
          gWidth: getRandomDouble(20, 90),
        );
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
