
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_flutter_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_flutter_app/cubits/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, AuthInitial());
		});

		group('login', () {
			blocTest<AuthCubit, AuthState>(
				'emits [AuthLoading, AuthAuthenticated] when login is successful',
				build: () => authCubit,
				act: (cubit) => cubit.login('test@example.com', 'password123'),
				expect: () => [AuthLoading(), AuthAuthenticated()],
			);

			blocTest<AuthCubit, AuthState>(
				'emits [AuthLoading, AuthError] when login fails',
				build: () => authCubit,
				act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
				expect: () => [AuthLoading(), AuthError('Login failed')],
			);
		});

		group('logout', () {
			blocTest<AuthCubit, AuthState>(
				'emits [AuthInitial] when logout is called',
				build: () => authCubit,
				act: (cubit) => cubit.logout(),
				expect: () => [AuthInitial()],
			);
		});
	});
}
