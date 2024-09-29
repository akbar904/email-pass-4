
import 'package:equatable/equatable.dart';
import 'package:my_app/models/user.dart'; // Adjust the import path as necessary

abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object?> get props => [];
}

class AuthInitial extends AuthState {
	const AuthInitial();
}

class AuthLoading extends AuthState {
	const AuthLoading();
}

class AuthAuthenticated extends AuthState {
	final User user;

	const AuthAuthenticated(this.user);

	@override
	List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {
	const AuthUnauthenticated();
}
