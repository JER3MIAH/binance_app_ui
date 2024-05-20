import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabBar extends ConsumerWidget {
  final TabController tabController;
  final bool isScrollable;
  final List<Widget> tabs;
  final EdgeInsetsGeometry? labelPadding;
  final TabAlignment? tabAlignment;
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
    this.isScrollable = false,
    this.labelPadding,
    this.tabAlignment,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;

    return Container(
      height: 40.dy,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 15.dx),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDarkmode ? const Color(0xFF1C2127) : Colors.grey.shade300,
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: isScrollable,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: theme.outline,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isDarkmode ? appColors.white : appColors.ltgreyText,
        ),
        unselectedLabelColor: theme.secondary,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDarkmode
              ? const Color(0xFFE9F0FF).withOpacity(.05)
              : appColors.white,
        ),
        padding: EdgeInsets.all(4.dx),
        labelPadding: labelPadding ?? EdgeInsets.zero,
        tabAlignment: tabAlignment,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: tabs,
      ),
    );
  }
}
