import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    testWidgets('Should pass colorscheme to flutter theme', (tester) async {
      final app = AppTheme(
        themeData: AppThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
        ),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              theme: AppTheme.of(context).getMaterialThemeData(),
              home: Builder(builder: (context) {
                return Row(
                  children: [
                    Container(
                      key: Key('tested'),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                      key: Key('tested2'),
                      color: AppTheme.of(context).colorScheme.primary,
                    ),
                  ],
                );
              }),
            );
          },
        ),
      );
      await tester.pumpWidget(app);
      final found = find.byKey(Key('tested'));
      final foundWidget = tester.widget<Container>(found);
      expect(foundWidget.color, equals(Colors.pink));
      final found2 = find.byKey(Key('tested'));
      final foundWidget2 = tester.widget<Container>(found2);
      expect(foundWidget2.color, equals(Colors.pink));
    });

    testWidgets('Should pass spacings', (tester) async {
      final app = AppTheme(
        themeData:
            const AppThemeData(spacings: Spacings(xs: 2, s: 4, m: 8, l: 24)),
        child: Builder(
          builder: (ctx) => MaterialApp(
            theme: AppTheme.of(ctx).getMaterialThemeData(),
            home: Container(
              key: Key('tested'),
              height: AppTheme.of(ctx).spacings.l,
            ),
          ),
        ),
      );
      await tester.pumpWidget(app);
      final found = find.byKey(Key('tested'));
      final foundWidget = tester.widget<Container>(found);
      expect(foundWidget.constraints!.minHeight, equals(24));
      expect(foundWidget.constraints!.maxHeight, equals(24));
    });

    testWidgets('Should have default even when not in tree', (tester) async {
      final app = AppTheme(
        themeData: AppThemeData(),
        child: Builder(
          builder: (ctx) => Container(
            key: Key('tested'),
            height: AppTheme.of(ctx).spacings.l,
          ),
        ),
      );
      await tester.pumpWidget(app);
      final found = find.byKey(Key('tested'));
      final foundWidget = tester.widget<Container>(found);
      expect(foundWidget.constraints!.minHeight, equals(24));
      expect(foundWidget.constraints!.maxHeight, equals(24));
    });
  });
}
