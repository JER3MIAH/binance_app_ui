import 'package:binance_app_ui/src/features/home/logic/providers/orderbook_provider.dart';
import 'package:binance_app_ui/src/features/home/presentation/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
// import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    // final channel = IOWebSocketChannel.connect(
    //     'wss://stream.binance.com:9443/ws/btcusdt@trade');

    // void streamListener() {
    //   channel.stream.listen(
    //     (message) {
    //       // channel.sink.add('received!');
    //       // channel.sink.close(status.goingAway);
    //       print(message);
    //     },
    //     onError: (error) {
    //       print('WebSocket Error: $error');
    //     },
    //     onDone: () {
    //       print('WebSocket connection closed');
    //     },
    //   );
    // }

    useEffect(() {
      // streamListener();
      ref.read(orderBookProvider.notifier).startTimer();
      return null;
    }, const []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.background,
      body: const HomeBody(),
    );
  }
}
