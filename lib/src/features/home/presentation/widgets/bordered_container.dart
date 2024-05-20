import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BorderedContainer extends ConsumerWidget {
  final Widget? child;
  final double height;
  const BorderedContainer({
    super.key,
    this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode = ref.watch(themeProvider).isDarkMode;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(
          color: isDarkmode ? appColors.dtBorder : appColors.ltBorder,
        ),
      ),
      child: child,
    );
  }
}
