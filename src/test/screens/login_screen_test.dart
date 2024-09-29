
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_cubit_app/screens/login_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('renders LoginScreen with LoginForm', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockAuthCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(LoginForm), findsOneWidget);
		});

		testWidgets('displays "Login" button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockAuthCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('displays email and password text fields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockAuthCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextFormField), findsNWidgets(2));
		});

		testWidgets('navigates to HomeScreen on successful login', (WidgetTester tester) async {
			whenListen(
				mockAuthCubit,
				Stream.fromIterable([AuthState.authenticated(User(email: 'test@example.com', name: 'Test User'))]),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockAuthCubit,
						child: LoginScreen(),
					),
				),
			);

			await tester.pumpAndSettle();

			expect(find.byType(HomeScreen), findsOneWidget);
		});

		// Add more widget tests based on the specific functionalities and UI elements in LoginScreen
	});
}
