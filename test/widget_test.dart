import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_crmestateflow/main.dart';

void main() {
  testWidgets('Login screen renders brand and sign in button', (tester) async {
    await tester.pumpWidget(const EstateFlowApp());

    expect(find.text('EstateFlow'), findsOneWidget);
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
