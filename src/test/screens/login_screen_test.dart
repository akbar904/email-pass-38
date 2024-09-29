
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:simple_flutter_app/screens/login_screen.dart';

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('renders LoginScreen with LoginForm', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(LoginForm), findsOneWidget);
		});
	});
}
