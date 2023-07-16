import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';

const bold = FontWeight.w700;
const semiBold = FontWeight.w600;
const medium = FontWeight.w500;
const light = FontWeight.w300;

extension ThemeEx on BuildContext {
  ThemeData theme() {
    return ThemeData(
      fontFamily: ksFontFamily,
      appBarTheme: appBarTheme(),
      useMaterial3: true,
      scaffoldBackgroundColor: kPrimary,
      textTheme: textTheme().apply(
        bodyColor: kBlack,
        displayColor: kBlack,
      ),
      textSelectionTheme: textSelectionTheme(),
      colorScheme: colorScheme(),
      iconTheme: iconTheme(),
      highlightColor: kTransparent,
      focusColor: kPrimary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme(),
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: kTransparent,
      elevation: s0,
      titleTextStyle: Theme.of(this).textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      ),
      foregroundColor: kBlack,
      toolbarHeight: s100,
    );
  }
  InputDecorationTheme inputDecorationTheme(){
    return const InputDecorationTheme(
      filled: true,
      fillColor: kTransparent,
      alignLabelWithHint: true,
    );
  }
  TextTheme textTheme() {
    return Theme.of(this).textTheme.copyWith(
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          labelLarge: labelLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
        );
  }

  TextStyle get headlineLarge => const TextStyle(
        fontSize: s96,
        fontWeight: semiBold,
      );
  TextStyle get headlineMedium => const TextStyle(
        fontSize: s70,
        fontWeight: semiBold,
      );
  TextStyle get headlineSmall => const TextStyle(
        fontSize: s60,
        fontWeight: bold,
      );
  TextStyle get titleLarge => const TextStyle(
        fontSize: s42,
        fontWeight: bold,
      );
  TextStyle get titleMedium => const TextStyle(
        fontSize: s38,
        fontWeight: bold,
      );
  TextStyle get titleSmall => const TextStyle(
        fontSize: s32,
        fontWeight: bold,
      );
  TextStyle get labelLarge => const TextStyle(
        fontSize: s26,
        fontWeight: bold,
      );
  TextStyle get bodyLarge => const TextStyle(
        fontSize: s18,
        fontWeight: medium,
      );
  TextStyle get bodyMedium => const TextStyle(
        fontSize: s14,
        fontWeight: medium,
      );
  TextStyle get bodySmall => const TextStyle(
        fontSize: s12,
        fontWeight: medium,
      );

  TextSelectionThemeData textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: kSecondary,
      selectionColor: kSecondary,
      selectionHandleColor: kSecondary,
    );
  }

  IconThemeData iconTheme() {
    return const IconThemeData(
      color: kBlack,
    );
  }

  ColorScheme colorScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: kPrimary,
      onPrimary: kPrimary,
      secondary: kSecondary,
      onSecondary: kSecondary,
      error: kRed,
      onError: kRed100,
      background: kWhite,
      onBackground: kWhite,
      surface: kGrey100,
      onSurface: kGrey100,
    );
  }
}
