
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/main.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('MainApp', () {
		testWidgets('renders LoginScreen when app starts', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});

		testWidgets('navigates to HomeScreen on successful login', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([Unauthenticated(), Authenticated(User(email: 'test@test.com', name: 'Test User'))]),
				initialState: Unauthenticated(),
			);

			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (_) => mockAuthCubit,
					child: MainApp(),
				),
			);
			await tester.pumpAndSettle();

			expect(find.byType(HomeScreen), findsOneWidget);
		});

		testWidgets('renders HomeScreen and allows logout', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([Authenticated(User(email: 'test@test.com', name: 'Test User')), Unauthenticated()]),
				initialState: Authenticated(User(email: 'test@test.com', name: 'Test User')),
			);

			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (_) => mockAuthCubit,
					child: MainApp(),
				),
			);
			await tester.pumpAndSettle();

			expect(find.byType(HomeScreen), findsOneWidget);

			await tester.tap(find.byType(TextButton));
			await tester.pumpAndSettle();

			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});
}
