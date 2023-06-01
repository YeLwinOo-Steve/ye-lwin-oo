import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';

extension WidgetEx on Widget {
  Padding addPadding({required EdgeInsetsGeometry edgeInsets}) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }

  Widget addCenter() {
    return Center(
      child: this,
    );
  }

  Widget addExpanded() {
    return Expanded(
      child: this,
    );
  }

  Widget addAlign({
    required AlignmentGeometry alignment,
  }) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget addSizedBox({
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget addContainer({
    double? width,
    double? height,
    Color? color,
    BoxDecoration? decoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      color: color,
      margin: margin,
      padding: padding,
      child: this,
    );
  }
  Widget addOpacity({required double opacity}){
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }
}

extension WidgetListEx on List<Widget> {
  Widget addStack({AlignmentGeometry? alignment}) {
    return Stack(
      alignment: alignment ?? AlignmentDirectional.topStart,
      children: this,
    );
  }

  Widget addColumn({
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: this,
    );
  }

  Widget addRow({
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: this,
    );
  }
}
