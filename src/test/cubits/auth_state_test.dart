
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_flutter_app/lib/cubits/auth_state.dart';

void main() {
	group('AuthState Tests', () {
		test('AuthInitial is a subclass of AuthState', () {
			expect(AuthInitial(), isA<AuthState>());
		});

		test('AuthLoading is a subclass of AuthState', () {
			expect(AuthLoading(), isA<AuthState>());
		});

		test('AuthAuthenticated is a subclass of AuthState', () {
			expect(AuthAuthenticated(), isA<AuthState>());
		});

		test('AuthError is a subclass of AuthState', () {
			expect(AuthError('Error message'), isA<AuthState>());
		});

		test('AuthError contains a message', () {
			final errorMessage = 'Error message';
			final authError = AuthError(errorMessage);
			expect(authError.message, errorMessage);
		});
	});
}
