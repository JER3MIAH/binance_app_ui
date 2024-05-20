import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuyBtcGradientButton extends StatelessWidget {
  final VoidCallback? onTap;
  const BuyBtcGradientButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 32.dy,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 15.dy),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF483BEB),
                Color(0xFF7847E1),
                Color(0xFFDD568D),
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Buy BTC',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: appColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizLine extends ConsumerWidget {
  const HorizLine({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode = ref.watch(themeProvider).isDarkMode;
    return Container(
      height: 1,
      margin: EdgeInsets.only(bottom: 15.dy),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDarkmode ? const Color(0xFF394047) : const Color(0xFFF1F1F1),
      ),
    );
  }
}
