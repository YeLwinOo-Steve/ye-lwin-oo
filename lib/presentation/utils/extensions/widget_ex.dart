import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

  Widget addExpanded({int? flex}) {
    return Expanded(
      flex: flex ?? 1,
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

  Widget addHero({required Object tag}) {
    return Hero(
      tag: tag,
      child: this,
    );
  }

  Widget addOpacity({required double opacity}) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  Widget addInkWell({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  Widget addScrollView({ScrollPhysics? physics}) {
    return SingleChildScrollView(
      physics: physics,
      child: this,
    );
  }

  Widget addVisibilityDetector({
    Key? key,
    required Function(VisibilityInfo) onDetectVisibility,
  }) {
    return VisibilityDetector(
      key: key ?? UniqueKey(),
      onVisibilityChanged: onDetectVisibility,
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

  Widget addWrap() {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: this,
    );
  }

  Widget addNestedListView({
    Axis? scrollDirection,
    ScrollPhysics? physics,
    bool? shrinkWrap,
    EdgeInsetsGeometry? padding,
  }) {
    return ListView(
      scrollDirection: scrollDirection ?? Axis.vertical,
      physics: physics,
      shrinkWrap: shrinkWrap ?? false,
      padding: padding,
      children: this,
    );
  }
}
