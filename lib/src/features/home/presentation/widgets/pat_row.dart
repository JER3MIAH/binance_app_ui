import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';

class PATrow extends StatelessWidget {
  //? PAT = Price, Amounts, Time
  final Color ftextColor;
  final double price, amount, total;
  final double gWidth;
  const PATrow({
    super.key,
    required this.ftextColor,
    required this.price,
    required this.amount,
    required this.total,
    this.gWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final tStyle = TextStyle(
      color: theme.secondary,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.dx),
          height: 28.dy,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price.toString(),
                style: tStyle.copyWith(color: ftextColor),
              ),
              Text(
                amount.toString(),
                style: tStyle,
              ),
              Text(
                formatNumber(total),
                style: tStyle,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 15.dx),
              alignment: Alignment.centerRight,
              height: 26.dy,
              width: (gWidth / 100) * 328.dx,
              color: ftextColor.withOpacity(.1),
            ),
          ],
        ),
      ],
    );
  }
}
//?  gWidth