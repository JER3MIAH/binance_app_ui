import 'package:binance_app_ui/src/features/home/presentation/components/top_bar.dart';
import 'package:binance_app_ui/src/features/home/presentation/widgets/widgets.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;

    Color color(Color light, Color dark) {
      return isDarkmode ? dark : light;
    }

    return Column(
      children: [
        const TopBar(),
        YBox(5.dy),
        BorderedContainer(
          height: 128.dx,
        ),
        YBox(5.dy),
        BorderedContainer(
          height: 591.dx,
        ),
        YBox(5.dy),
        BorderedContainer(
          height: 350.dx,
        ),
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
    );
  }
}
