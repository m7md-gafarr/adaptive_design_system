import 'package:adaptive_design_system/src/adaptive_screen_util.dart';
import 'package:adaptive_design_system/src/colors/dark_colors.dart';
import 'package:adaptive_design_system/src/colors/light_colors.dart';
import 'package:flutter/material.dart';

class AdaptiveColors {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color _getDeviceColor({
    required BuildContext context,
    required Color lightMobile,
    required Color lightTablet,
    required Color lightDesktop,
    required Color darkMobile,
    required Color darkTablet,
    required Color darkDesktop,
    double? opacity,
  }) {
    final deviceType = AdaptiveScreenUtil.getDeviceType(context);
    final isDark = isDarkMode(context);

    Color color;

    if (isDark) {
      switch (deviceType) {
        case AdaptiveDeviceType.mobile:
          color = darkMobile;
          break;
        case AdaptiveDeviceType.tablet:
          color = darkTablet;
          break;
        case AdaptiveDeviceType.desktop:
          color = darkDesktop;
          break;
      }
    } else {
      switch (deviceType) {
        case AdaptiveDeviceType.mobile:
          color = lightMobile;
          break;
        case AdaptiveDeviceType.tablet:
          color = lightTablet;
          break;
        case AdaptiveDeviceType.desktop:
          color = lightDesktop;
          break;
      }
    }

    return opacity != null ? color.withOpacity(opacity) : color;
  }

  static Color primaryColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.primaryMobile,
      lightTablet: LightThemeColors.primaryTablet,
      lightDesktop: LightThemeColors.primaryDesktop,
      darkMobile: DarkThemeColors.primaryMobile,
      darkTablet: DarkThemeColors.primaryTablet,
      darkDesktop: DarkThemeColors.primaryDesktop,
      opacity: opacity,
    );
  }

  static Color secondaryColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.secondaryMobile,
      lightTablet: LightThemeColors.secondaryTablet,
      lightDesktop: LightThemeColors.secondaryDesktop,
      darkMobile: DarkThemeColors.secondaryMobile,
      darkTablet: DarkThemeColors.secondaryTablet,
      darkDesktop: DarkThemeColors.secondaryDesktop,
      opacity: opacity,
    );
  }

  static Color errorColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.errorMobile,
      lightTablet: LightThemeColors.errorTablet,
      lightDesktop: LightThemeColors.errorDesktop,
      darkMobile: DarkThemeColors.errorMobile,
      darkTablet: DarkThemeColors.errorTablet,
      darkDesktop: DarkThemeColors.errorDesktop,
      opacity: opacity,
    );
  }

  static Color warningColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.warningMobile,
      lightTablet: LightThemeColors.warningTablet,
      lightDesktop: LightThemeColors.warningDesktop,
      darkMobile: DarkThemeColors.warningMobile,
      darkTablet: DarkThemeColors.warningTablet,
      darkDesktop: DarkThemeColors.warningDesktop,
      opacity: opacity,
    );
  }

  static Color successColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.successMobile,
      lightTablet: LightThemeColors.successTablet,
      lightDesktop: LightThemeColors.successDesktop,
      darkMobile: DarkThemeColors.successMobile,
      darkTablet: DarkThemeColors.successTablet,
      darkDesktop: DarkThemeColors.successDesktop,
      opacity: opacity,
    );
  }

  static Color infoColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.infoMobile,
      lightTablet: LightThemeColors.infoTablet,
      lightDesktop: LightThemeColors.infoDesktop,
      darkMobile: DarkThemeColors.infoMobile,
      darkTablet: DarkThemeColors.infoTablet,
      darkDesktop: DarkThemeColors.infoDesktop,
      opacity: opacity,
    );
  }

  static Color backgroundColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.backgroundMobile,
      lightTablet: LightThemeColors.backgroundTablet,
      lightDesktop: LightThemeColors.backgroundDesktop,
      darkMobile: DarkThemeColors.backgroundMobile,
      darkTablet: DarkThemeColors.backgroundTablet,
      darkDesktop: DarkThemeColors.backgroundDesktop,
      opacity: opacity,
    );
  }

  static Color surfaceColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.surfaceMobile,
      lightTablet: LightThemeColors.surfaceTablet,
      lightDesktop: LightThemeColors.surfaceDesktop,
      darkMobile: DarkThemeColors.surfaceMobile,
      darkTablet: DarkThemeColors.surfaceTablet,
      darkDesktop: DarkThemeColors.surfaceDesktop,
      opacity: opacity,
    );
  }

  static Color cardColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.cardMobile,
      lightTablet: LightThemeColors.cardTablet,
      lightDesktop: LightThemeColors.cardDesktop,
      darkMobile: DarkThemeColors.cardMobile,
      darkTablet: DarkThemeColors.cardTablet,
      darkDesktop: DarkThemeColors.cardDesktop,
      opacity: opacity,
    );
  }

  static Color textPrimaryColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.textPrimaryMobile,
      lightTablet: LightThemeColors.textPrimaryTablet,
      lightDesktop: LightThemeColors.textPrimaryDesktop,
      darkMobile: DarkThemeColors.textPrimaryMobile,
      darkTablet: DarkThemeColors.textPrimaryTablet,
      darkDesktop: DarkThemeColors.textPrimaryDesktop,
      opacity: opacity,
    );
  }

  static Color textSecondaryColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.textSecondaryMobile,
      lightTablet: LightThemeColors.textSecondaryTablet,
      lightDesktop: LightThemeColors.textSecondaryDesktop,
      darkMobile: DarkThemeColors.textSecondaryMobile,
      darkTablet: DarkThemeColors.textSecondaryTablet,
      darkDesktop: DarkThemeColors.textSecondaryDesktop,
      opacity: opacity,
    );
  }

  static Color textHintColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.textHintMobile,
      lightTablet: LightThemeColors.textHintTablet,
      lightDesktop: LightThemeColors.textHintDesktop,
      darkMobile: DarkThemeColors.textHintMobile,
      darkTablet: DarkThemeColors.textHintTablet,
      darkDesktop: DarkThemeColors.textHintDesktop,
      opacity: opacity,
    );
  }

  static Color borderColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.borderMobile,
      lightTablet: LightThemeColors.borderTablet,
      lightDesktop: LightThemeColors.borderDesktop,
      darkMobile: DarkThemeColors.borderMobile,
      darkTablet: DarkThemeColors.borderTablet,
      darkDesktop: DarkThemeColors.borderDesktop,
      opacity: opacity,
    );
  }

  static Color dividerColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.dividerMobile,
      lightTablet: LightThemeColors.dividerTablet,
      lightDesktop: LightThemeColors.dividerDesktop,
      darkMobile: DarkThemeColors.dividerMobile,
      darkTablet: DarkThemeColors.dividerTablet,
      darkDesktop: DarkThemeColors.dividerDesktop,
      opacity: opacity,
    );
  }

  static Color shadowColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.shadowMobile,
      lightTablet: LightThemeColors.shadowTablet,
      lightDesktop: LightThemeColors.shadowDesktop,
      darkMobile: DarkThemeColors.shadowMobile,
      darkTablet: DarkThemeColors.shadowTablet,
      darkDesktop: DarkThemeColors.shadowDesktop,
      opacity: opacity,
    );
  }

  static Color iconColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.iconMobile,
      lightTablet: LightThemeColors.iconTablet,
      lightDesktop: LightThemeColors.iconDesktop,
      darkMobile: DarkThemeColors.iconMobile,
      darkTablet: DarkThemeColors.iconTablet,
      darkDesktop: DarkThemeColors.iconDesktop,
      opacity: opacity,
    );
  }

  static Color iconSecondaryColor(BuildContext context, {double? opacity}) {
    return _getDeviceColor(
      context: context,
      lightMobile: LightThemeColors.iconSecondaryMobile,
      lightTablet: LightThemeColors.iconSecondaryTablet,
      lightDesktop: LightThemeColors.iconSecondaryDesktop,
      darkMobile: DarkThemeColors.iconSecondaryMobile,
      darkTablet: DarkThemeColors.iconSecondaryTablet,
      darkDesktop: DarkThemeColors.iconSecondaryDesktop,
      opacity: opacity,
    );
  }
}

extension AdaptiveColorsExtension on BuildContext {
  Color adaptivePrimary([double? opacity]) =>
      AdaptiveColors.primaryColor(this, opacity: opacity);
  Color adaptiveSecondary([double? opacity]) =>
      AdaptiveColors.secondaryColor(this, opacity: opacity);
  Color adaptiveError([double? opacity]) =>
      AdaptiveColors.errorColor(this, opacity: opacity);
  Color adaptiveWarning([double? opacity]) =>
      AdaptiveColors.warningColor(this, opacity: opacity);
  Color adaptiveSuccess([double? opacity]) =>
      AdaptiveColors.successColor(this, opacity: opacity);
  Color adaptiveInfo([double? opacity]) =>
      AdaptiveColors.infoColor(this, opacity: opacity);

  Color adaptiveBackground([double? opacity]) =>
      AdaptiveColors.backgroundColor(this, opacity: opacity);
  Color adaptiveSurface([double? opacity]) =>
      AdaptiveColors.surfaceColor(this, opacity: opacity);
  Color adaptiveCard([double? opacity]) =>
      AdaptiveColors.cardColor(this, opacity: opacity);

  Color adaptiveTextPrimary([double? opacity]) =>
      AdaptiveColors.textPrimaryColor(this, opacity: opacity);
  Color adaptiveTextSecondary([double? opacity]) =>
      AdaptiveColors.textSecondaryColor(this, opacity: opacity);
  Color adaptiveTextHint([double? opacity]) =>
      AdaptiveColors.textHintColor(this, opacity: opacity);

  Color adaptiveBorder([double? opacity]) =>
      AdaptiveColors.borderColor(this, opacity: opacity);
  Color adaptiveDivider([double? opacity]) =>
      AdaptiveColors.dividerColor(this, opacity: opacity);
  Color adaptiveShadow([double? opacity]) =>
      AdaptiveColors.shadowColor(this, opacity: opacity);

  Color adaptiveIcon([double? opacity]) =>
      AdaptiveColors.iconColor(this, opacity: opacity);
  Color adaptiveIconSecondary([double? opacity]) =>
      AdaptiveColors.iconSecondaryColor(this, opacity: opacity);

  bool get isDarkMode => AdaptiveColors.isDarkMode(this);
}
