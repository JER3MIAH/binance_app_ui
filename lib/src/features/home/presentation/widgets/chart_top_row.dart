import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChartsTopRow extends ConsumerWidget {
  const ChartsTopRow({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkMode = ref.watch(themeProvider).isDarkMode;
    final tStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: theme.secondary,
    );
    Widget text(String text) {
      return SizedBox(
        height: 28.dy,
        width: 40.dx,
        child: Center(
          child: Text(text, style: tStyle),
        ),
      );
    }

    Widget divider() {
      return SvgAsset(
        assetName: isDarkMode ? dividerDark : dividerLight,
      );
    }
    return Container(
      margin: EdgeInsets.only(left: 15.dx),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 32.dy,
          width: 549.dx,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Time'),
              text('1H'),
              text('2H'),
              text('4H'),
              Container(
                height: 28.dy,
                width: 40.dx,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xFF555C63)
                      : const Color(0xFFCFD3D8),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    '1D',
                    style: tStyle.copyWith(
                      color: theme.outline,
                    ),
                  ),
                ),
              ),
              text('1W'),
              text('1M'),
              SvgAsset(
                assetName: arrowDown,
                color: theme.secondary,
              ),
              divider(),
              SvgAsset(assetName: candleChartIcon),
              divider(),
              Text('Fx Indicators', style: tStyle),
              divider(),
              SvgAsset(assetName: undoIcon),
              SvgAsset(assetName: redoIcon),
              divider(),
            ],
          ),
        ),
      ),
    );
  }
}
