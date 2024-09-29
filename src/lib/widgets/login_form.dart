
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
	final Function(String, String)? onLogin;

	const LoginForm({Key? key, this.onLogin}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final emailController = TextEditingController();
		final passwordController = TextEditingController();

		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					TextField(
						controller: emailController,
						decoration: const InputDecoration(
							labelText: 'Email',
						),
						keyboardType: TextInputType.emailAddress,
					),
					const SizedBox(height: 16.0),
					TextField(
						controller: passwordController,
						decoration: const InputDecoration(
							labelText: 'Password',
						),
						obscureText: true,
					),
					const SizedBox(height: 32.0),
					ElevatedButton(
						onPressed: () {
							final email = emailController.text;
							final password = passwordController.text;
							if (onLogin != null) {
								onLogin!(email, password);
							}
						},
						child: const Text('Login'),
					),
				],
			),
		);
	}
}
