import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCheckBox extends ConsumerWidget {
  final bool isSelected;
  final String title;
  final bool topPadding;
  final VoidCallback? onTap;

  const CustomCheckBox({
    super.key,
    required this.title,
    required this.isSelected,
    this.topPadding = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode = ref.watch(themeProvider).isDarkMode;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16.dy,
                width: 16.dy,
                padding: EdgeInsets.all(1.4.dy),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color:
                        isDarkmode ? const Color(0xFF373B3F) : appColors.black,
                    width: 0.8,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? appColors.green : Colors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              XBox(8.dx),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  XBox(6.dx),
                  SvgAsset(assetName: infoIcon),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
