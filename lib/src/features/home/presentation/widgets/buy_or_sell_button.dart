import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';

class BuyOrSellButton extends StatelessWidget {
  final bool isSell;
  final VoidCallback? onTap;
  const BuyOrSellButton({
    super.key,
    required this.isSell,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BounceInAnimation(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 32.dy,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: isSell ? appColors.red : appColors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                isSell ? 'Sell' : 'Buy',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: appColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
