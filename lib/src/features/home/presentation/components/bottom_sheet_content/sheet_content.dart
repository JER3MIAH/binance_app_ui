import 'package:binance_app_ui/src/features/home/presentation/components/bottom_sheet_content/buy_btc_view.dart';
import 'package:binance_app_ui/src/features/home/presentation/widgets/widgets.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomSheetContent extends HookConsumerWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final theme = Theme.of(context).colorScheme;
    final tabController = useTabController(initialLength: 2);

    return DefaultTabController(
      length: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.dx),
        child: Column(
          children: [
            YBox(25.dy),
            CustomTabBar(
              height: 35.dy,
              tabController: tabController,
              padding: EdgeInsets.zero,
              hasBorder: true,
              tabs: const [
                Tab(text: 'Buy'),
                Tab(text: 'Sell'),
              ],
            ),
            YBox(15.dy),
            Flexible(
              child: TabBarView(
                controller: tabController,
                children: const [
                  BuyBtcView(isSelling: false),
                  BuyBtcView(isSelling: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
