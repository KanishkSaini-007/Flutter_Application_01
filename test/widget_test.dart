import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Profile shows the original student and learning information', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Kanishk Saini'), findsOneWidget);
    expect(find.textContaining('Student at NMIMS'), findsOneWidget);
    expect(find.text('LEARNING & EXPLORING'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Flutter Demo Homepage'), 200);
    expect(find.text('App Development Club'), findsOneWidget);
    expect(find.text('Flutter Demo Homepage'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  for (final width in [320.0, 390.0, 1024.0]) {
    testWidgets('Profile scrolls without overflow at $width px', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 740);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      await tester.scrollUntilVisible(find.text('Flutter Demo Homepage'), 200);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('Large text stays readable without overflow', (tester) async {
    tester.view.physicalSize = const Size(320, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(textScaler: TextScaler.linear(2)),
        child: const MyApp(),
      ),
    );
    await tester.scrollUntilVisible(find.text('Flutter Demo Homepage'), 200);
    expect(tester.takeException(), isNull);
  });
}
