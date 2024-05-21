import 'dart:math';

import 'package:binance_app_ui/src/features/home/data/models/chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartProvider = ChangeNotifierProvider<ChartProvider>((ref) {
  return ChartProvider();
});

class ChartProvider extends ChangeNotifier {
  List<ChartModel> mockChartData = [];
  ChartProvider() {
    generateMockChartData();
  }

  void generateMockChartData() {
  final random = Random();
  const int dataCount = 50;

  double basePrice = 35000;

  for (int i = 0; i < dataCount; i++) {
    final double open = basePrice + random.nextDouble() * 2000 - 1000; // Open price varies within +/- 1000
    final double close = open + random.nextDouble() * 1000 - 500; // Close price within +/- 500 of open
    final double high = max(open, close) + random.nextDouble() * 500; // High price within 0-500 of max(open, close)
    final double low = min(open, close) - random.nextDouble() * 500; // Low price within 0-500 of min(open, close)

    mockChartData.add(
      ChartModel(
        time: DateTime.now().millisecondsSinceEpoch + i * 60000, // One minute intervals
        open: open,
        high: high,
        low: low,
        close: close,
      ),
    );

    basePrice = close; // Adjust the base price for the next data point to simulate real market movement
  }

  notifyListeners();
}

}