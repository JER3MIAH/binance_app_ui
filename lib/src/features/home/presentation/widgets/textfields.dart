import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  final TextEditingController? controller;
  final String prefixText;
  final bool isNotField;
  final bool readOnly;
  const CustomTextField({
    super.key,
    this.controller,
    required this.prefixText,
    this.isNotField = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkmode = ref.watch(themeProvider).isDarkMode;
    final defStyle = TextStyle(
        fontSize: 12.sp, fontWeight: FontWeight.w500, color: theme.secondary);

    return Container(
      height: 40.dy,
      margin: EdgeInsets.only(bottom: 15.dy),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDarkmode ? const Color(0xFF373B3F) : const Color(0xFFF1F1F1),
        ),
      ),
      child: Center(
        child: TextField(
          readOnly: readOnly,
          keyboardType: TextInputType.number,
          controller: controller,
          style: defStyle.copyWith(color: theme.outline),
          cursorColor: theme.secondary,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 13.dy),
            border: InputBorder.none,
            hintTextDirection: TextDirection.ltr,
            hintText: isNotField ? '' : '0.00',
            hintStyle: defStyle,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15.dx),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    prefixText,
                    style: defStyle,
                  ),
                  XBox(5.dx),
                  SvgAsset(assetName: infoIcon),
                ],
              ),
            ),
            suffixIcon: isNotField
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Good till cancelled',
                        style: defStyle,
                      ),
                      XBox(10.dx),
                      SvgAsset(
                        assetName: arrowDown,
                        width: 10.25.dx,
                        color: theme.secondary,
                      ),
                      XBox(20.dx),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 5.dx, top: 13),
                    child: Text(
                      'USD',
                      style: defStyle,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
