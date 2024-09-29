
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_cubit_app/widgets/login_form.dart';
import 'package:com.example.simple_cubit_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocListener<AuthCubit, AuthState>(
				listener: (context, state) {
					if (state is Authenticated) {
						Navigator.of(context).pushReplacement(
							MaterialPageRoute(builder: (context) => HomeScreen())
						);
					}
				},
				child: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							LoginForm(),
							SizedBox(height: 20),
							ElevatedButton(
								onPressed: () {
									final formState = Form.of(context);
									if (formState?.validate() ?? false) {
										final email = formState?.fields['email']?.value ?? '';
										final password = formState?.fields['password']?.value ?? '';
										context.read<AuthCubit>().login(email, password);
									}
								},
								child: Text('Login'),
							),
						],
					),
				),
			),
		);
	}
}
