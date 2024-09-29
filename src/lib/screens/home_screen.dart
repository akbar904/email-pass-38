
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_app/cubits/auth_cubit.dart';
import 'package:simple_flutter_app/cubits/auth_state.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Home Screen'),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						BlocProvider.of<AuthCubit>(context).logout();
					},
					child: const Text('Logout'),
				),
			),
		);
	}
}
