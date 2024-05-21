import 'package:binance_app_ui/src/features/home/data/models/pat.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';

class PATrow extends StatelessWidget {
  //? PAT = Price, Amounts, Time
  final Color ftextColor;
  final PATmodel paTmodel;
  const PATrow({
    super.key,
    required this.ftextColor,
    required this.paTmodel,
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
                paTmodel.price.toString(),
                style: tStyle.copyWith(color: ftextColor),
              ),
              Text(
                paTmodel.amount.toString(),
                style: tStyle,
              ),
              Text(
                formatNumber(paTmodel.total),
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
              width: (paTmodel.gWidth / 100) * 328.dx,
              color: ftextColor.withOpacity(.1),
            ),
          ],
        ),
      ],
    );
  }
}
//?  gWidth