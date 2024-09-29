
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:simple_flutter_app/widgets/login_form.dart';

void main() {
	group('LoginForm Widget Tests', () {
		testWidgets('Renders email and password text fields', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginForm(),
					),
				),
			);

			// Assert
			expect(find.byType(TextField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
		});

		testWidgets('Renders login button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginForm(),
					),
				),
			);

			// Assert
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('Login button calls the login method', (WidgetTester tester) async {
			// Arrange
			var loginCalled = false;
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginForm(
							onLogin: (email, password) {
								loginCalled = true;
							},
						),
					),
				),
			);

			// Act
			await tester.enterText(find.byType(TextField).first, 'test@example.com');
			await tester.enterText(find.byType(TextField).last, 'password123');
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			// Assert
			expect(loginCalled, isTrue);
		});
	});
}
