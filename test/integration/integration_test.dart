import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:player/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test', (WidgetTester tester) async {
    runApp(const MyApp());

    await tester.pumpAndSettle();
    expect(find.text('Getting...'), findsOneWidget);
  });
}