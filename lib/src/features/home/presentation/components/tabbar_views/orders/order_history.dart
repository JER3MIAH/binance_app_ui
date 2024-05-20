import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'No Order History',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: theme.outline,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.dx).copyWith(top: 10.dy),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: theme.secondary,
              height: 1.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        YBox(40.dy),
      ],
    );
  }
}
