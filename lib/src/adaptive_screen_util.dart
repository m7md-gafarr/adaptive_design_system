import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveScreenUtil {
  static const Size mobileDesignSize = Size(375, 812);
  static const Size tabletDesignSize = Size(768, 1024);
  static const Size desktopDesignSize = Size(1440, 900);

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1100;

  static Size getDesignSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < mobileBreakpoint) {
      return mobileDesignSize;
    } else if (screenWidth < tabletBreakpoint) {
      return tabletDesignSize;
    } else {
      return desktopDesignSize;
    }
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static AdaptiveDeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileBreakpoint) {
      return AdaptiveDeviceType.mobile;
    } else if (width < tabletBreakpoint) {
      return AdaptiveDeviceType.tablet;
    } else {
      return AdaptiveDeviceType.desktop;
    }
  }

  static double adaptiveFontSize(
    double baseFontSize, {
    double? mobileScale,
    double? tabletScale,
    double? desktopScale,
    double? minSize,
    double? maxSize,
  }) {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) {
      return (baseFontSize * (mobileScale ?? 1.0)).sp;
    }

    final deviceType = getDeviceType(context);

    double scaleFactor;
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        scaleFactor = mobileScale ?? 1.0;
        break;
      case AdaptiveDeviceType.tablet:
        scaleFactor = tabletScale ?? 0.9;
        break;
      case AdaptiveDeviceType.desktop:
        scaleFactor = desktopScale ?? 0.8;
        break;
    }

    double adaptedSize = (baseFontSize * scaleFactor).sp;

    if (minSize != null) {
      adaptedSize = adaptedSize.clamp(minSize.sp, double.infinity);
    }
    if (maxSize != null) {
      adaptedSize = adaptedSize.clamp(0, maxSize.sp);
    }

    return adaptedSize;
  }

  static double adaptiveWidth(
    double baseWidth, {
    double? mobileScale,
    double? tabletScale,
    double? desktopScale,
  }) {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) {
      return (baseWidth * (mobileScale ?? 1.0)).w;
    }

    final deviceType = getDeviceType(context);

    double scaleFactor;
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        scaleFactor = mobileScale ?? 1.0;
        break;
      case AdaptiveDeviceType.tablet:
        scaleFactor = tabletScale ?? 1.2;
        break;
      case AdaptiveDeviceType.desktop:
        scaleFactor = desktopScale ?? 1.5;
        break;
    }

    return (baseWidth * scaleFactor).w;
  }

  static double adaptiveHeight(
    double baseHeight, {
    double? mobileScale,
    double? tabletScale,
    double? desktopScale,
  }) {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) {
      return (baseHeight * (mobileScale ?? 1.0)).h;
    }

    final deviceType = getDeviceType(context);

    double scaleFactor;
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        scaleFactor = mobileScale ?? 1.0;
        break;
      case AdaptiveDeviceType.tablet:
        scaleFactor = tabletScale ?? 1.1;
        break;
      case AdaptiveDeviceType.desktop:
        scaleFactor = desktopScale ?? 1.2;
        break;
    }

    return (baseHeight * scaleFactor).h;
  }

  static double adaptiveRadius(
    double baseRadius, {
    double? mobileScale,
    double? tabletScale,
    double? desktopScale,
  }) {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) {
      // Fallback to mobile scaling when context not available
      return (baseRadius * (mobileScale ?? 1.0)).r;
    }

    final deviceType = getDeviceType(context);

    double scaleFactor;
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        scaleFactor = mobileScale ?? 1.0;
        break;
      case AdaptiveDeviceType.tablet:
        scaleFactor = tabletScale ?? 1.1;
        break;
      case AdaptiveDeviceType.desktop:
        scaleFactor = desktopScale ?? 1.2;
        break;
    }

    return (baseRadius * scaleFactor).r;
  }

  static double getMaxContentWidth(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        return double.infinity; // No constraint on mobile
      case AdaptiveDeviceType.tablet:
        return 700; // Reasonable max width for tablet
      case AdaptiveDeviceType.desktop:
        return 1200; // Max width for desktop content
    }
  }

  static EdgeInsets getContentPadding(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        return EdgeInsets.symmetric(horizontal: 16.w);
      case AdaptiveDeviceType.tablet:
        return EdgeInsets.symmetric(horizontal: 32.w);
      case AdaptiveDeviceType.desktop:
        return EdgeInsets.symmetric(horizontal: 48.w);
    }
  }
}

enum AdaptiveDeviceType { mobile, tablet, desktop }

class StackRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
