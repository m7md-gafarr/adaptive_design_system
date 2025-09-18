import 'package:adaptive_design_system/src/adaptive_screen_util.dart';
import 'package:flutter/material.dart';

class ResponsiveTextStyles {
  static TextStyle getResponsiveTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? height,
    String? fontFamily,
    double? letterSpacing,
    TextDecoration? decoration,
    double? mobileScale,
    double? tabletScale,
    double? desktopScale,
    double? minSize,
    double? maxSize,
  }) {
    return TextStyle(
      fontSize: AdaptiveScreenUtil.adaptiveFontSize(
        fontSize,
        mobileScale: mobileScale,
        tabletScale: tabletScale,
        desktopScale: desktopScale,
        minSize: minSize,
        maxSize: maxSize,
      ),
      fontWeight: fontWeight,
      color: color,
      height: height,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle displayLarge(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle displayMedium(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle displaySmall(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle headlineLarge(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle headlineMedium(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle headlineSmall(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle bodyLarge(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle bodyMedium(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle bodySmall(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle labelLarge(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle labelMedium(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle labelSmall(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle buttonText(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle inputText(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle inputHint(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle inputLabel(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle inputHelper(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle inputError(BuildContext context, Color color) =>
      getResponsiveTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color,
      );
}

extension ResponsiveTextStyleExtension on TextStyle {
  TextStyle get responsive {
    return copyWith(
      fontSize: fontSize != null
          ? AdaptiveScreenUtil.adaptiveFontSize(fontSize!)
          : null,
    );
  }
}
