import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BtcStatCont extends ConsumerWidget {
  final String title, stat;
  const BtcStatCont({
    super.key,
    required this.title,
    required this.stat,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;

    return Container(
      height: 48.dy,
      width: 134.dx,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: isDarkmode ? appColors.dtBorder : appColors.ltBorder,
          ),
        ),
      ),
      padding: EdgeInsets.only(left: title != 'change' ? 15.dx : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              SvgAsset(
                assetName: title == 'change'
                    ? clockIcon
                    : title == 'high'
                        ? highIcon
                        : title == 'low'
                            ? lowIcon
                            : chartIcon,
              ),
              XBox(5.dx),
              Text(
                '24h $title',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: theme.secondary,
                ),
              ),
            ],
          ),
          YBox(10.dy),
          Text(
            '520.80 +1.25%',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: title == 'change' ? appColors.green : theme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
