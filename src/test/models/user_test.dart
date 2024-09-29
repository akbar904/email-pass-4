
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cubit_app/models/user.dart';

void main() {
	group('User Model', () {
		test('should create a User instance correctly', () {
			final user = User(email: 'test@example.com', name: 'Test User');
			
			expect(user.email, 'test@example.com');
			expect(user.name, 'Test User');
		});

		test('should serialize User to JSON correctly', () {
			final user = User(email: 'test@example.com', name: 'Test User');
			final json = user.toJson();
			
			expect(json, {
				'email': 'test@example.com',
				'name': 'Test User',
			});
		});

		test('should deserialize User from JSON correctly', () {
			final json = {
				'email': 'test@example.com',
				'name': 'Test User',
			};
			final user = User.fromJson(json);
			
			expect(user.email, 'test@example.com');
			expect(user.name, 'Test User');
		});
	});
}
