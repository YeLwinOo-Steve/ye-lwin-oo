import 'dart:math';

import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double percentWidth(double percent) => screenWidth * (percent / 100);
  double percentHeight(double percent) => screenHeight * (percent / 100);
  SizedBox percentSizedBox({double? pWidth, double? pHeight}) => SizedBox(
        width: percentWidth(pWidth ?? 0),
        height: percentHeight(pHeight ?? 0),
      );
  EdgeInsets get paddingZero => EdgeInsets.zero;
  EdgeInsets symmetricPercentPadding({double? hPercent, double? vPercent}) =>
      EdgeInsets.symmetric(
        horizontal: percentWidth(hPercent ?? 0),
        vertical: percentHeight(vPercent ?? 0),
      );
  EdgeInsets symmetricPadding({double? h, double? v}) => EdgeInsets.symmetric(
        horizontal: h ?? 0,
        vertical: v ?? 0,
      );

  EdgeInsets allPercentPadding({double? allPercent}) => EdgeInsets.symmetric(
        horizontal: percentWidth(allPercent ?? 0),
        vertical: percentHeight(allPercent ?? 0),
      );
  EdgeInsets allPadding({double? p}) => EdgeInsets.all(p ?? 0);
  EdgeInsets percentPadding({double? l, double? r, double? t, double? b}) =>
      EdgeInsets.only(
        left: percentWidth(l ?? 0),
        right: percentWidth(r ?? 0),
        top: percentHeight(t ?? 0),
        bottom: percentHeight(b ?? 0),
      );
  EdgeInsets padding({double? l, double? r, double? t, double? b}) =>
      EdgeInsets.only(
        left: l ?? 0,
        right: r ?? 0,
        bottom: b ?? 0,
        top: t ?? 0,
      );

  double textScaleFactor({double maxTextScaleFactor = 1}) {
    final width = MediaQuery.of(this).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
