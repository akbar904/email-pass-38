
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_app/screens/home_screen.dart';
import 'package:simple_flutter_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays Logout button', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(AuthAuthenticated());

			// Act
			await tester.pumpWidget(
				BlocProvider<AuthCubit>.value(
					value: mockAuthCubit,
					child: const HomeScreen(),
				),
			);

			// Assert
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeScreen Interaction Tests', () {
		testWidgets('calls logout when Logout button is tapped', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(AuthAuthenticated());

			await tester.pumpWidget(
				BlocProvider<AuthCubit>.value(
					value: mockAuthCubit,
					child: const HomeScreen(),
				),
			);

			// Act
			await tester.tap(find.text('Logout'));
			await tester.pump();

			// Assert
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
