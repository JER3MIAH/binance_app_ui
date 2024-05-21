import 'package:binance_app_ui/src/features/home/presentation/components/components.dart';
import 'package:binance_app_ui/src/features/home/presentation/widgets/widgets.dart';
import 'package:binance_app_ui/src/features/navigation/app_navigator.dart';
import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeBody extends HookConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;
    final firstTabController = useTabController(initialLength: 3);
    final secondTabController = useTabController(initialLength: 4);

    final style = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );

    void showBottomSheet() {
      AppNavigator.showBottomSheet(
        content: const BottomSheetContent(),
        bgColor: isDarkmode ? const Color(0xFF20252B) : appColors.white,
      );
    }

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopBar(),
              YBox(5.dy),
              BorderedContainer(
                height: 128.dx,
                padding:
                    EdgeInsets.symmetric(horizontal: 20.dx, vertical: 12.dy),
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
                height: 530.dx,
                child: Column(
                  children: [
                    YBox(15.dy),
                    CustomTabBar(
                      tabController: firstTabController,
                      tabs: const [
                        Tab(text: 'Charts'),
                        Tab(text: 'OrderBook'),
                        Tab(text: 'Recent trades'),
                      ],
                    ),
                    YBox(10.dy),
                    Flexible(
                      child: TabBarView(
                        controller: firstTabController,
                        children: const [
                          ChartsView(),
                          OrderBookView(),
                          RecentTradeView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //*-------------------------------------------------------------------------------------
              YBox(5.dy),
              BorderedContainer(
                height: 350.dx,
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      YBox(15.dy),
                      CustomTabBar(
                        tabController: secondTabController,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelPadding: EdgeInsets.symmetric(horizontal: 30.dx),
                        tabs: const [
                          Tab(text: 'Open Orders'),
                          Tab(text: 'Positions'),
                          Tab(text: 'Order History'),
                          Tab(text: 'Trade History'),
                        ],
                      ),
                      YBox(10.dy),
                      Flexible(
                        child: TabBarView(
                          controller: secondTabController,
                          children: const [
                            OpenOrderView(),
                            PositionsView(),
                            OrderHistoryView(),
                            TradeHistoryView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //*-------------------------------------------------------------------------------------
              Container(
                height: 64.dy,
                padding: EdgeInsets.symmetric(horizontal: 20.dx),
                child: Row(
                  children: [
                    BuyOrSellButton(
                      isSell: false,
                      onTap: () {
                        showBottomSheet();
                      },
                    ),
                    XBox(18.dx),
                    BuyOrSellButton(
                      isSell: true,
                      onTap: () {
                        showBottomSheet();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
