import 'package:binance_app_ui/src/features/home/presentation/components/top_bar.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 108.dy),
        child: const TopBar(),
      ),
    );
  }
}
