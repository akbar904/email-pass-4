
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import 'package:your_app/models/user.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());
	
	void login(String email, String password) async {
		emit(AuthLoading());
		// Simulate a network call
		await Future.delayed(Duration(seconds: 1));
		if (email == 'test@example.com' && password == 'password123') {
			final user = User(email: email, name: 'Test User');
			emit(AuthAuthenticated(user));
		} else {
			emit(AuthError('Login failed'));
		}
	}
	
	void logout() {
		emit(AuthUnauthenticated());
	}
}
