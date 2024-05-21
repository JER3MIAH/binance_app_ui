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

    PopupMenuItem<dynamic> buildMenuItem(String text) {
      return PopupMenuItem(
          child: SizedBox(
        width: 150.dx,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ));
    }

    return Container(
      height: 78.dy,
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
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: theme.outline, fontSize: 20.sp),
            ),
            const Spacer(),
            SvgAsset(assetName: userIcon),
            XBox(15.dx),
            GestureDetector(
              onTap: ref.read(themeProvider.notifier).toggleTheme,
              child: SvgAsset(assetName: globeIcon),
            ),
            XBox(15.dx),
            PopupMenuButton(
              icon: SvgAsset(assetName: drawerIcon),
              color: isDarkmode ? const Color(0xFF1C2127) : appColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isDarkmode
                      ? const Color(0xFF373B3F)
                      : const Color(0xFFCFD9E4),
                ),
              ),
              itemBuilder: (context) {
                return [
                  buildMenuItem('Exchange'),
                  buildMenuItem('Wallets'),
                  buildMenuItem('Roqqu Hub'),
                  buildMenuItem('Log out'),
                ];
              },
            )
          ],
        ),
      ),
    );
  }
}
