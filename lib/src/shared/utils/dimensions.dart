// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';

// constant values
const double padding = 15;
const double hPadding = 20;
const double vPadding = 20;
const double borderRadius = 12;
const double mainButtonHorizontalPadding = 21;
const double screenHorizontalPadding = 16;

const Duration kDuration = Duration(milliseconds: 500);
const Curve kCurve = Curves.easeInOut;

class Dims {
  const Dims._();
  // the app was designed on an iphone frame with w:h = 360:800
  static Size designSize = const Size(375, 773); //375 773
  // the device [running the application] size
  static late Size deviceSize;

  // used to set the deviceSize during the application startup process
  static void setSize(MediaQueryData media) {
    deviceSize = Size(
      // media.size.width - (media.padding.left + media.padding.right),
      // media.size.height - (media.padding.top + media.padding.bottom),
      media.size.width,
      media.size.height,
    );
  }

  // naive implementation
  static double quotient(double dim1, double dim2) {
    return dim1 > dim2 ? dim1 / dim2 : dim2 / dim1;
  }

  // horizontal[width] quotient
  static double dxQuotient() {
    final quotient = deviceSize.width / designSize.width;

    return quotient;
  }

  // vertical[height] quotient
  static double dyQuotient() {
    final quotient = deviceSize.height / designSize.height;

    return quotient;
  }

  // give horizontal spacing in percentages in respect to device width
  static double dxPercent(num extent) {
    return deviceSize.width * extent;
  }

  // give vertical spacing in percentages in respect to device height
  static double dyPercent(num extent) {
    return deviceSize.height * extent;
  }

  // give responsive horizontal spacing [value is calculated based on device size and design size]
  static double dx(num x) {
    final quotient = dxQuotient();

    return quotient * x;
  }

  // give responsive vertical spacing [value is calculated based on device size and design size]
  static double dy(num x) {
    final quotient = dyQuotient();

    return quotient * x;
  }

  // give responsive font sizes [based on device size and design size]
  static double sp(num x) {
    final dxQuotient_ = dxQuotient();
    final dyQuotient_ = dyQuotient();
    final ratio = min(dxQuotient_, dyQuotient_);

    return ratio * x;
  }
}

extension DimsExtensionOld on BuildContext {
  Orientation get deviceOrientation => MediaQuery.of(this).orientation;
  bool get isLandscape => deviceOrientation == Orientation.landscape;
  bool get isPortrait => deviceOrientation == Orientation.portrait;
}

extension DimsExtension on num {
  // horizontal spacing
  double get dx => Dims.dx(this);
  // vertical spacing
  double get dy => Dims.dy(this);
  // vertical spacing [in percentage]
  double get dyPercent => Dims.dyPercent(this);
  // horizontal spacing [in percentage]
  double get dxPercent => Dims.dxPercent(this);
  // font size
  double get sp => Dims.sp(this);
}

class XBox extends StatelessWidget {
  const XBox(this._width);

  final double _width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
    );
  }
}

class YBox extends StatelessWidget {
  const YBox(this._height);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}
