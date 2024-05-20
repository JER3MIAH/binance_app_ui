import 'package:binance_app_ui/src/features/home/presentation/components/top_bar.dart';
import 'package:binance_app_ui/src/features/home/presentation/widgets/widgets.dart';
import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;

    Color color(Color light, Color dark) {
      return isDarkmode ? dark : light;
    }

    final style = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            YBox(5.dy),
            BorderedContainer(
              height: 128.dx,
              padding: EdgeInsets.symmetric(horizontal: 20.dx, vertical: 12.dy),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgAsset(assetName: btcUsdtIcon),
                      XBox(10.dx),
                      Text(
                        'BTC/USDT',
                        style: style,
                      ),
                      XBox(10.dx),
                      SvgAsset(
                        assetName: arrowDown,
                        color: theme.outline,
                      ),
                      XBox(15.dx),
                      Text(
                        '\$20,634',
                        style: style.copyWith(
                          color: appColors.green,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BtcStatCont(
                          title: 'change',
                          stat: '520.80 +1.25%',
                        ),
                        BtcStatCont(
                          title: 'high',
                          stat: '520.80 +1.25%',
                        ),
                        BtcStatCont(
                          title: 'low',
                          stat: '520.80 +1.25%',
                        ),
                        BtcStatCont(
                          title: 'volume',
                          stat: '520.80 +1.25%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //*-------------------------------------------------------------------------------------
            YBox(5.dy),
            BorderedContainer(
              height: 591.dx,
              
            ),
            //*-------------------------------------------------------------------------------------
            YBox(5.dy),
            BorderedContainer(
              height: 350.dx,
            ),
            //*-------------------------------------------------------------------------------------
            Container(
              height: 64.dy,
              padding: EdgeInsets.symmetric(horizontal: 20.dx),
              child: Row(
                children: [
                  BuyOrSellButton(
                    isSell: false,
                    onTap: () {},
                  ),
                  XBox(18.dx),
                  BuyOrSellButton(
                    isSell: true,
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
