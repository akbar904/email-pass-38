
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthError extends AuthState {
	final String message;

	AuthError(this.message);
}
