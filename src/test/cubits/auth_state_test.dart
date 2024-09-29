
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/cubits/auth_state.dart'; // Adjust the import path as necessary

// Since lib/cubits/auth_state.dart only defines states, we need to ensure states are correctly represented

void main() {
	group('AuthState', () {
		test('supports value equality', () {
			expect(AuthInitial(), AuthInitial());
			expect(AuthLoading(), AuthLoading());
			expect(AuthAuthenticated(User(email: 'email@example.com', name: 'User')), 
				AuthAuthenticated(User(email: 'email@example.com', name: 'User')));
			expect(AuthUnauthenticated(), AuthUnauthenticated());
		});

		test('props are correct', () {
			expect(AuthInitial().props, []);
			expect(AuthLoading().props, []);
			expect(AuthAuthenticated(User(email: 'email@example.com', name: 'User')).props, 
				[User(email: 'email@example.com', name: 'User')]);
			expect(AuthUnauthenticated().props, []);
		});
	});
}
