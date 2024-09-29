
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						BlocProvider.of<AuthCubit>(context).logout();
					},
					child: Text('Logout'),
				),
			),
		);
	}
}
