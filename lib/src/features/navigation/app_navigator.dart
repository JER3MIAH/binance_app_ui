import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppNavigator {
  //? Use to show modal bottom sheet
  static void showBottomSheet(
      {required Widget content, required Color bgColor}) {
    Get.bottomSheet(
      SizedBox(
        height: 604.dy,
        child: content,
      ),
      backgroundColor: bgColor,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
    );
  }
}
