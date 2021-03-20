import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/app.dart';

void main() {
  group('App', () {
    testWidgets('is a StatelessWidget', (tester) async {
      expect(App(), isA<StatelessWidget>());
    });

    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(App());
      await tester.pump(Duration(seconds: 1));
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
