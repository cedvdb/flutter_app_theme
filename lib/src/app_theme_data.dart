import 'package:flutter/material.dart';

import 'border_radiuses.dart';
import 'spacings.dart';

class AppThemeData {
  final ColorScheme colorScheme;
  final BorderRadiuses borderRadiuses;
  final Spacings spacings;

  const AppThemeData({
    this.colorScheme = const ColorScheme.light(),
    this.spacings = const Spacings.defaulted(),
    this.borderRadiuses = const BorderRadiuses.defaulted(),
  });

  ThemeData getMaterialThemeData() {
    return ThemeData.from(colorScheme: colorScheme);
  }
}
