import 'package:flutter/material.dart';

const double s0 = 0.0;
const double s05 = 0.5;
const double s08 = 0.8;
const double s1 = 1.0;
const double s2 = 2.0;
const double s3 = 3.0;
const double s4 = 4.0;
const double s5 = 5.0;
const double s6 = 6.0;
const double s8 = 8.0;
const double s10 = 10.0;
const double s12 = 12.0;
const double s14 = 14.0;
const double s18 = 18.0;
const double s20 = 20.0;
const double s24 = 24.0;
const double s26 = 26.0;
const double s28 = 28.0;
const double s30 = 30.0;
const double s32 = 32.0;
const double s38 = 38.0;
const double s40 = 40.0;
const double s42 = 42.0;
const double s48 = 48.0;
const double s50 = 50.0;
const double s60 = 60.0;
const double s65 = 65.0;
const double s70 = 70.0;
const double s80 = 80.0;
const double s96 = 96.0;
const double s100 = 100.0;
const double s120 = 120.0;
const double s150 = 150.0;
const double s180 = 180.0;
const double s200 = 200.0;
const double s220 = 220.0;
const double s250 = 250.0;
const double s400 = 400.0;

//duration
const int d10 = 10;
const int d50 = 50;
const int d100 = 100;
const int d150 = 150;
const int d200 = 200;
const int d300 = 300;
const int d500 = 500;
const int d800 = 800;
const int d1000 = 1000;
const int d2000 = 2000;
const int d2870 = 2870;
const int d3000 = 3000;
const int d4000 = 4000;
const int d4300 = 4300;
const int d5000 = 5000;
const Duration duration50 = Duration(milliseconds: d50);
const Duration duration100 = Duration(milliseconds: d100);
const Duration duration150 = Duration(milliseconds: d150);
const Duration duration200 = Duration(milliseconds: d200);
const Duration duration300 = Duration(milliseconds: d300);
const Duration duration500 = Duration(milliseconds: d500);
const Duration duration800 = Duration(milliseconds: d800);
const Duration duration1000 = Duration(milliseconds: d1000);
const Duration duration2000 = Duration(milliseconds: d2000);
const Duration duration2870 = Duration(milliseconds: d2870);
const Duration duration3000 = Duration(milliseconds: d3000);
const Duration duration4000 = Duration(milliseconds: d4000);
const Duration duration4300 = Duration(milliseconds: d4300);
const Duration duration5000 = Duration(milliseconds: d5000);
const Duration duration10s = Duration(seconds: d10);

const double _tiny = s4;
const double _small = s8;
const double _medium = s14;
const double _large = s20;
const double _massive = s32;
const double _enormous = s60;

const SizedBox noSpace = SizedBox.shrink();

const SizedBox horizontalSpaceTiny = SizedBox(width: _tiny);
const SizedBox horizontalSpaceSmall = SizedBox(width: _small);
const SizedBox horizontalSpaceMedium = SizedBox(width: _medium);
const SizedBox horizontalSpaceLarge = SizedBox(width: _large);
const SizedBox horizontalSpaceMassive = SizedBox(width: _massive);
const SizedBox horizontalSpaceEnormous = SizedBox(width: _enormous);

const SizedBox verticalSpaceTiny = SizedBox(height: _tiny);
const SizedBox verticalSpaceSmall = SizedBox(height: _small);
const SizedBox verticalSpaceMedium = SizedBox(height: _medium);
const SizedBox verticalSpaceLarge = SizedBox(height: _large);
const SizedBox verticalSpaceMassive = SizedBox(height: _massive);
const SizedBox verticalSpaceEnormous = SizedBox(height: _enormous);

SizedBox customSpace({double? w, double? h}) => SizedBox(
      width: w ?? 0,
      height: h ?? 0,
    );
