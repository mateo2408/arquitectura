import 'package:flutter_test/flutter_test.dart';
import 'package:arquitectura/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PetAuthorityApp());

    // Verify that our app title is present.
    expect(find.text('My Pets'), findsOneWidget);
  });
}
