import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData themeData;

  AppTheme({required this.themeData, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.themeData != themeData;
  }

  static AppThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (theme != null) return theme.themeData;

    // if no theme was found in ancestor we create one with the current mat Theme
    final matTheme = Theme.of(context);
    return AppThemeData(colorScheme: matTheme.colorScheme);
  }
}
