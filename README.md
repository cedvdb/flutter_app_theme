# app_theme

Flutter theme with spacings

```dart
AppTheme(
  themeData: AppThemeData(spacings: Spacings(xs: 2, s: 4, m: 8, l: 24)),
  child: Builder(
    builder: (ctx) => MaterialApp(
      theme: AppTheme.of(ctx).getMaterialThemeData(),
      home: Container(
        key: Key('tested'),
        height: AppTheme.of(ctx).spacings.l,
      ),
    ),
  ),
)
```
