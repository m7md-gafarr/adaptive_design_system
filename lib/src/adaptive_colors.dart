import 'package:adaptive_design_system/src/adaptive_screen_util.dart';
import 'package:adaptive_design_system/src/config/adaptive_config.dart';
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
      lightMobile:
          AdaptiveConfig.lightConfig?.primaryMobile ??
          Theme.of(context).colorScheme.primary,
      lightTablet:
          AdaptiveConfig.lightConfig?.primaryTablet ??
          Theme.of(context).colorScheme.primary,
      lightDesktop:
          AdaptiveConfig.lightConfig?.primaryDesktop ??
          Theme.of(context).colorScheme.primary,
      darkMobile:
          AdaptiveConfig.darkConfig?.primaryMobile ??
          Theme.of(context).colorScheme.primary,
      darkTablet:
          AdaptiveConfig.darkConfig?.primaryTablet ??
          Theme.of(context).colorScheme.primary,
      darkDesktop:
          AdaptiveConfig.darkConfig?.primaryDesktop ??
          Theme.of(context).colorScheme.primary,
      opacity: opacity,
    );
  }

  static Color secondaryColor(BuildContext context, {double? opacity}) {
    final scheme = Theme.of(context).colorScheme;
    return _getDeviceColor(
      context: context,
      lightMobile:
          AdaptiveConfig.lightConfig?.secondaryMobile ?? scheme.secondary,
      lightTablet:
          AdaptiveConfig.lightConfig?.secondaryTablet ?? scheme.secondary,
      lightDesktop:
          AdaptiveConfig.lightConfig?.secondaryDesktop ?? scheme.secondary,
      darkMobile:
          AdaptiveConfig.darkConfig?.secondaryMobile ?? scheme.secondary,
      darkTablet:
          AdaptiveConfig.darkConfig?.secondaryTablet ?? scheme.secondary,
      darkDesktop:
          AdaptiveConfig.darkConfig?.secondaryDesktop ?? scheme.secondary,
      opacity: opacity,
    );
  }

  static Color errorColor(BuildContext context, {double? opacity}) {
    final scheme = Theme.of(context).colorScheme;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.errorMobile ?? scheme.error,
      lightTablet: AdaptiveConfig.lightConfig?.errorTablet ?? scheme.error,
      lightDesktop: AdaptiveConfig.lightConfig?.errorDesktop ?? scheme.error,
      darkMobile: AdaptiveConfig.darkConfig?.errorMobile ?? scheme.error,
      darkTablet: AdaptiveConfig.darkConfig?.errorTablet ?? scheme.error,
      darkDesktop: AdaptiveConfig.darkConfig?.errorDesktop ?? scheme.error,
      opacity: opacity,
    );
  }

  static Color warningColor(BuildContext context, {double? opacity}) {
    final scheme = Theme.of(context).colorScheme;
    final fallback = scheme.tertiary;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.warningMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.warningTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.warningDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.warningMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.warningTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.warningDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color successColor(BuildContext context, {double? opacity}) {
    final scheme = Theme.of(context).colorScheme;
    final fallback = scheme.secondary;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.successMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.successTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.successDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.successMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.successTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.successDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color infoColor(BuildContext context, {double? opacity}) {
    final scheme = Theme.of(context).colorScheme;
    final fallback = scheme.primary;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.infoMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.infoTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.infoDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.infoMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.infoTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.infoDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color backgroundColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallbackLight = theme.colorScheme.surface;
    final fallbackDark = theme.colorScheme.surface;
    return _getDeviceColor(
      context: context,
      lightMobile:
          AdaptiveConfig.lightConfig?.backgroundMobile ?? fallbackLight,
      lightTablet:
          AdaptiveConfig.lightConfig?.backgroundTablet ?? fallbackLight,
      lightDesktop:
          AdaptiveConfig.lightConfig?.backgroundDesktop ?? fallbackLight,
      darkMobile: AdaptiveConfig.darkConfig?.backgroundMobile ?? fallbackDark,
      darkTablet: AdaptiveConfig.darkConfig?.backgroundTablet ?? fallbackDark,
      darkDesktop: AdaptiveConfig.darkConfig?.backgroundDesktop ?? fallbackDark,
      opacity: opacity,
    );
  }

  static Color surfaceColor(BuildContext context, {double? opacity}) {
    final scheme = Theme.of(context).colorScheme;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.surfaceMobile ?? scheme.surface,
      lightTablet: AdaptiveConfig.lightConfig?.surfaceTablet ?? scheme.surface,
      lightDesktop:
          AdaptiveConfig.lightConfig?.surfaceDesktop ?? scheme.surface,
      darkMobile: AdaptiveConfig.darkConfig?.surfaceMobile ?? scheme.surface,
      darkTablet: AdaptiveConfig.darkConfig?.surfaceTablet ?? scheme.surface,
      darkDesktop: AdaptiveConfig.darkConfig?.surfaceDesktop ?? scheme.surface,
      opacity: opacity,
    );
  }

  static Color cardColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallback = theme.cardColor;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.cardMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.cardTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.cardDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.cardMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.cardTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.cardDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color textPrimaryColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallback =
        theme.textTheme.bodyLarge?.color ?? theme.colorScheme.onSurface;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.textPrimaryMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.textPrimaryTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.textPrimaryDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.textPrimaryMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.textPrimaryTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.textPrimaryDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color textSecondaryColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallback =
        theme.textTheme.bodyMedium?.color?.withOpacity(0.7) ??
        (theme.colorScheme.onSurface.withOpacity(0.7));
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.textSecondaryMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.textSecondaryTablet ?? fallback,
      lightDesktop:
          AdaptiveConfig.lightConfig?.textSecondaryDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.textSecondaryMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.textSecondaryTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.textSecondaryDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color textHintColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallback = theme.hintColor;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.textHintMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.textHintTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.textHintDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.textHintMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.textHintTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.textHintDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color borderColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallback = theme.dividerColor;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.borderMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.borderTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.borderDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.borderMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.borderTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.borderDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color dividerColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallback = theme.dividerColor;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.dividerMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.dividerTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.dividerDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.dividerMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.dividerTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.dividerDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color shadowColor(BuildContext context, {double? opacity}) {
    final fallback = Colors.black.withOpacity(0.12);
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.shadowMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.shadowTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.shadowDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.shadowMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.shadowTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.shadowDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color iconColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final fallback = theme.iconTheme.color ?? theme.colorScheme.onSurface;
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.iconMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.iconTablet ?? fallback,
      lightDesktop: AdaptiveConfig.lightConfig?.iconDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.iconMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.iconTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.iconDesktop ?? fallback,
      opacity: opacity,
    );
  }

  static Color iconSecondaryColor(BuildContext context, {double? opacity}) {
    final theme = Theme.of(context);
    final base = theme.iconTheme.color ?? theme.colorScheme.onSurface;
    final fallback = base.withOpacity(0.6);
    return _getDeviceColor(
      context: context,
      lightMobile: AdaptiveConfig.lightConfig?.iconSecondaryMobile ?? fallback,
      lightTablet: AdaptiveConfig.lightConfig?.iconSecondaryTablet ?? fallback,
      lightDesktop:
          AdaptiveConfig.lightConfig?.iconSecondaryDesktop ?? fallback,
      darkMobile: AdaptiveConfig.darkConfig?.iconSecondaryMobile ?? fallback,
      darkTablet: AdaptiveConfig.darkConfig?.iconSecondaryTablet ?? fallback,
      darkDesktop: AdaptiveConfig.darkConfig?.iconSecondaryDesktop ?? fallback,
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
