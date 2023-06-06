
import 'dart:ui';

import 'package:flutter/cupertino.dart';

extension PathEx on Path {
  Path createAnimatedPath(
    double animationPercent,
  ) {
    /// Don't know anything about it, just copied code from stackoverflow :)
    /// ComputeMetrics can only be iterated once!
    final totalLength = computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return _extractPathUntilLength(currentLength);
  }

  Path _extractPathUntilLength(
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = computeMetrics().iterator;
    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
