import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';

class TextAndPrice extends StatelessWidget {
  final String text;
  final String price;
  final bool isNGN;
  const TextAndPrice({
    super.key,
    required this.text,
    this.price = '',
    this.isNGN = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            isNGN
                ? SvgAsset(
                    assetName: arrowDown,
                    color: Theme.of(context).colorScheme.secondary,
                    width: 12.dx,
                  )
                : const SizedBox.shrink(),
          ],
        ),
        YBox(10.dy),
        Text(
          price,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
