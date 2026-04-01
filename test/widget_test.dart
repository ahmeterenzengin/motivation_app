import 'package:flutter_test/flutter_test.dart';
import 'package:motivation_app/main.dart';

void main() {
  testWidgets('App shows a quote and New Quote button', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('New Quote'), findsOneWidget);
    expect(find.text('Motivation App'), findsOneWidget);
  });
}
