import 'package:adaptive_design_system/src/adaptive_screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveDimensions on num {
  double get rw {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) return toDouble().w;

    return AdaptiveScreenUtil.adaptiveWidth(toDouble());
  }

  double get rh {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) return toDouble().h;

    return AdaptiveScreenUtil.adaptiveHeight(toDouble());
  }

  double get rr {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) return toDouble().r;

    return AdaptiveScreenUtil.adaptiveRadius(toDouble());
  }

  double get rsp {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) return toDouble().sp;

    return AdaptiveScreenUtil.adaptiveFontSize(toDouble());
  }

  EdgeInsets get responsivePadding {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) {
      return EdgeInsets.all(toDouble());
    }

    return AdaptiveScreenUtil.getContentPadding(context);
  }

  EdgeInsets get responsiveHorizontalPadding {
    return EdgeInsets.symmetric(horizontal: rw);
  }

  EdgeInsets get responsiveVerticalPadding {
    return EdgeInsets.symmetric(vertical: rh);
  }

  EdgeInsets responsiveSymmetricPadding({
    double? horizontal,
    double? vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal?.rw ?? 0,
      vertical: vertical?.rh ?? 0,
    );
  }

  EdgeInsets get responsiveAllPadding {
    return EdgeInsets.all(rw);
  }
}

extension ResponsiveContainer on Widget {
  Widget responsiveContainer({
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color? color,
    double? borderRadius,
  }) {
    return Container(
      width: width?.rw,
      height: height?.rh,
      padding: padding ?? EdgeInsets.all(16.rw),
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius.rr)
            : null,
      ),
      child: this,
    );
  }

  Widget responsiveCenter() {
    final context = StackRouter.navigatorKey.currentContext;
    if (context == null) return this;

    final maxWidth = AdaptiveScreenUtil.getMaxContentWidth(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: this,
      ),
    );
  }

  Widget responsivePadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: (top ?? vertical ?? all ?? 0).rh,
        bottom: (bottom ?? vertical ?? all ?? 0).rh,
        left: (left ?? horizontal ?? all ?? 0).rw,
        right: (right ?? horizontal ?? all ?? 0).rw,
      ),
      child: this,
    );
  }
}

class ResponsiveLayout {
  static EdgeInsets cardPadding(BuildContext context) {
    final deviceType = AdaptiveScreenUtil.getDeviceType(context);
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        return EdgeInsets.all(16.rw);
      case AdaptiveDeviceType.tablet:
        return EdgeInsets.all(24.rw);
      case AdaptiveDeviceType.desktop:
        return EdgeInsets.all(32.rw);
    }
  }

  static double gap(BuildContext context, {double multiplier = 1.0}) {
    final deviceType = AdaptiveScreenUtil.getDeviceType(context);
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        return (16 * multiplier).rh;
      case AdaptiveDeviceType.tablet:
        return (20 * multiplier).rh;
      case AdaptiveDeviceType.desktop:
        return (24 * multiplier).rh;
    }
  }

  static double iconSize(BuildContext context, {double baseSize = 24}) {
    final deviceType = AdaptiveScreenUtil.getDeviceType(context);
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        return baseSize.rw;
      case AdaptiveDeviceType.tablet:
        return (baseSize * 1.1).rw;
      case AdaptiveDeviceType.desktop:
        return (baseSize * 1.2).rw;
    }
  }

  static double buttonHeight(BuildContext context) {
    final deviceType = AdaptiveScreenUtil.getDeviceType(context);
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        return 40.rh;
      case AdaptiveDeviceType.tablet:
        return 40.rh;
      case AdaptiveDeviceType.desktop:
        return 40.rh;
    }
  }

  static double inputHeight(BuildContext context) {
    final deviceType = AdaptiveScreenUtil.getDeviceType(context);
    switch (deviceType) {
      case AdaptiveDeviceType.mobile:
        return 48.rh;
      case AdaptiveDeviceType.tablet:
        return 52.rh;
      case AdaptiveDeviceType.desktop:
        return 56.rh;
    }
  }
}

class ResponsiveBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1100;
  static const double desktop = 1440;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < tablet;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tablet;
  }

  static T responsive<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
