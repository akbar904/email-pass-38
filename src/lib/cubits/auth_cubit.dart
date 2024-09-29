
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		try {
			emit(AuthLoading());
			// Simulate a network call
			await Future.delayed(Duration(seconds: 1));
			if (email == 'test@example.com' && password == 'password123') {
				emit(AuthAuthenticated());
			} else {
				emit(AuthError('Login failed'));
			}
		} catch (e) {
			emit(AuthError(e.toString()));
		}
	}

	void logout() {
		emit(AuthInitial());
	}
}
