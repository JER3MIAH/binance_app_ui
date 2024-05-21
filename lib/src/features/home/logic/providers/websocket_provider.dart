import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socketProvider = ChangeNotifierProvider<WebSocketProvider>((ref) {
  return WebSocketProvider();
});

class WebSocketProvider extends ChangeNotifier {
  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');

  String _btcUsdtPrice = '';
  String get btcUsdtPrice => _btcUsdtPrice;

  WebSocketProvider() {
    streamListener();
  }

  void streamListener() {
    channel.stream.listen(
      (message) {
        Map data = jsonDecode(message);
        double price = double.parse(data['p']);
        _btcUsdtPrice = price.toStringAsFixed(2);
        notifyListeners();
        // log('Price: $_btcUsdtPrice');
      },
      onError: (error) {
        log('WebSocket Error: $error');
      },
      onDone: () {
        log('WebSocket connection closed');
      },
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
