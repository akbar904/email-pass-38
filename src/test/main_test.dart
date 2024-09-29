
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:simple_flutter_app/main.dart';

// Mock dependencies if necessary
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('should display LoginScreen on app start', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});

		testWidgets('should display HomeScreen when authenticated', (WidgetTester tester) async {
			final authCubit = MockAuthCubit();
			whenListen(
				authCubit,
				Stream.fromIterable([AuthAuthenticated()]),
				initialState: AuthInitial(),
			);

			await tester.pumpWidget(
				BlocProvider.value(
					value: authCubit,
					child: MyApp(),
				),
			);

			await tester.pumpAndSettle();

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
