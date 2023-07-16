import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

extension LayoutAdapter on BuildContext {
  T adaptive<T>(
    T xs,
    T lg, {
    T? sm,
    T? md,
    T? xl,
  }) {
    return layout.value<T>(
      xs: xs,
      sm: sm ?? (md ?? xs),
      md: md ?? sm,
      lg: lg,
      xl: xl ?? lg,
    );
  }

  /// mobile < 650
  bool get isMobile => MediaQuery.of(this).size.width < 650;

  /// tablet >= 650
  bool get isTablet => MediaQuery.of(this).size.width >= 650;

  ///desktop >= 1100
  bool get isDesktop => MediaQuery.of(this).size.width >= 1100;
}
