import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBar extends ConsumerWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;

    Color color(Color light, Color dark) {
      return isDarkmode ? dark : light;
    }

    return Container(
      height: 108.dy,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primary,
        border: Border(
          bottom: BorderSide(
            color: color(appColors.ltBorder, appColors.dtBorder),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.dx),
      child: SafeArea(
        child: Row(
          children: [
            SvgAsset(assetName: isDarkmode ? topLogoDark : topLogoLight),
            XBox(10.dx),
            Text(
              'Sisyphus',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: theme.outline,
                  ),
            ),
            const Spacer(),
            SvgAsset(assetName: userIcon),
            XBox(15.dx),
            GestureDetector(
              onTap: ref.read(themeProvider.notifier).toggleTheme,
              child: SvgAsset(assetName: globeIcon),
            ),
            XBox(15.dx),
            SvgAsset(assetName: drawerIcon),
          ],
        ),
      ),
    );
  }
}
