import 'package:binance_app_ui/src/features/home/logic/providers/orderbook_provider.dart';
import 'package:binance_app_ui/src/features/home/presentation/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;

    useEffect(() {
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
