import 'package:flutter/cupertino.dart';

import 'app_theme_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData themeData;

  AppTheme({required this.themeData, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.themeData != themeData;
  }

  static AppThemeData of(BuildContext ctx) {
    final theme = ctx.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (theme == null) return AppThemeData();
    return theme.themeData;
  }
}
