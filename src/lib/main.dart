
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => AuthCubit(),
			child: MaterialApp(
				title: 'Simple Flutter App',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: AuthNavigator(),
			),
		);
	}
}

class AuthNavigator extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocBuilder<AuthCubit, AuthState>(
			builder: (context, state) {
				if (state is AuthAuthenticated) {
					return HomeScreen();
				} else {
					return LoginScreen();
				}
			},
		);
	}
}
