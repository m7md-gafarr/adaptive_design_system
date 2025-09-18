import 'package:adaptive_design_system/src/config/adaptive_dark_theme_colors_config.dart';
import 'package:adaptive_design_system/src/config/adaptive_light_theme_colors_config.dart';

class AdaptiveConfig {
  static AdaptiveDarkThemeColorsConfig? darkConfig;
  static AdaptiveLightThemeColorsConfig? lightConfig;

  static void init({
    AdaptiveLightThemeColorsConfig? light,
    AdaptiveDarkThemeColorsConfig? dark,
  }) {
    lightConfig = light;
    darkConfig = dark;
  }

  static void update({
    AdaptiveLightThemeColorsConfig? light,
    AdaptiveDarkThemeColorsConfig? dark,
  }) {
    if (light != null) lightConfig = light;
    if (dark != null) darkConfig = dark;
  }
}
