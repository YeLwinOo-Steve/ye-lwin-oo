import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  Size getSize() {
    return MediaQuery.of(this).size;
  }

  double get screenWidth => getSize().width;
  double get screenHeight => getSize().height;
  double percentWidth(double percent) => screenWidth * (percent / 100);
  double percentHeight(double percent) => screenHeight * (percent / 100);
  SizedBox percentSizedBox({double? pWidth, double? pHeight}) => SizedBox(
        width: percentWidth(pWidth ?? 0),
        height: percentHeight(pHeight ?? 0),
      );
  EdgeInsets symmetricPercentPadding({double? hPercent, double? vPercent}) =>
      EdgeInsets.symmetric(
        horizontal: percentWidth(hPercent ?? 0),
        vertical: percentHeight(vPercent ?? 0),
      );
  EdgeInsets allPercentPadding({double? allPercent}) => EdgeInsets.symmetric(
        horizontal: percentWidth(allPercent ?? 0),
        vertical: percentHeight(allPercent ?? 0),
      );
  EdgeInsets percentPadding({double? l, double? r, double? t, double? b}) =>
      EdgeInsets.only(
        left: percentWidth(l ?? 0),
        right: percentWidth(r ?? 0),
        top: percentHeight(t ?? 0),
        bottom: percentHeight(b ?? 0),
      );
}
