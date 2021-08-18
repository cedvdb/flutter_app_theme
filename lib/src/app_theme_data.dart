import 'package:flutter/material.dart';

import 'border_radiuses.dart';
import 'spacings.dart';

class AppThemeData {
  final ColorScheme colorScheme;
  final BorderRadiuses borderRadiuses;
  final Spacings spacings;

  AppThemeData({
    ColorScheme? colorScheme,
    Spacings? spacings,
    BorderRadiuses? borderRadiuses,
  })  : colorScheme =
            colorScheme ?? ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        spacings = spacings ?? const Spacings.defaulted(),
        borderRadiuses = borderRadiuses ?? const BorderRadiuses.defaulted();

  ThemeData getMaterialThemeData() {
    return ThemeData(
      colorScheme: colorScheme,
    );
  }
}
