import 'package:binance_app_ui/src/features/home/logic/providers/orderbook_provider.dart';
import 'package:binance_app_ui/src/features/home/presentation/widgets/widgets.dart';
import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderBookView extends ConsumerWidget {
  const OrderBookView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;
    final greyColor =
        isDarkmode ? const Color(0xFF353945) : const Color(0xFFCFD3D8);
    final tStyle = TextStyle(
      color: theme.secondary,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );

    final paTmodels1 = ref.watch(orderBookProvider).paTmodels1;
    final paTmodels2 = ref.watch(orderBookProvider).paTmodels2;

    Widget buildHeader() {
      Widget heading(String top, String bottom) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              top,
              style: tStyle,
            ),
            Text(
              bottom,
              style: tStyle.copyWith(
                fontSize: 9.sp,
                height: 2,
              ),
            ),
          ],
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.dx).copyWith(top: 10.dy),
        height: 42.dy,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            heading('Price', '(USDT)'),
            heading('Amounts', '(BTC)'),
            heading('Total', ''),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.dx),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 104.dx,
                height: 34.dy,
                child: Row(
                  children: [
                    _buildGreyCont(greyColor, coloredDrawerIcon1),
                    _buildGreyCont(greyColor, coloredDrawerIcon2),
                    _buildGreyCont(greyColor, coloredDrawerIcon3),
                  ],
                ),
              ),
              Container(
                width: 63.dx,
                height: 32.dy,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: greyColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: theme.outline,
                      ),
                    ),
                    SvgAsset(
                      assetName: arrowDown,
                      color: const Color(0xFF737A91),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //*-------------------------------------------------------------------------------------
          buildHeader(),
          YBox(10.dy),
          Column(
            children: List.generate(
              paTmodels1.length,
              (index) => PATrow(
                ftextColor: appColors.orange,
                paTmodel: paTmodels1[index],
              ),
            ),
          ),

          //*-----------------------------------------------
          SizedBox(
            height: 48.dy,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '36,641.20',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: appColors.green,
                  ),
                ),
                XBox(10.dx),
                SvgAsset(
                  assetName: highIcon,
                  color: appColors.green,
                ),
                XBox(10.dx),
                Text(
                  '36,641.20',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.outline,
                  ),
                ),
              ],
            ),
          ),
          //*-----------------------------------------------
          Column(
            children: List.generate(
              paTmodels2.length,
              (index) => PATrow(
                ftextColor: appColors.orange,
                paTmodel: paTmodels2[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGreyCont(Color greyColor, String assetName) {
    return Container(
      width: 32.dx,
      height: 32.dx,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: assetName == coloredDrawerIcon1 ? greyColor : null,
      ),
      child: Center(child: SvgAsset(assetName: assetName)),
    );
  }
}
