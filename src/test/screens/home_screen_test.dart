
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays "Home Screen" text', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);
			
			expect(find.text('Home Screen'), findsOneWidget);
		});
		
		testWidgets('displays "Logout" button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);
			
			expect(find.widgetWithText(ElevatedButton, 'Logout'), findsOneWidget);
		});
		
		testWidgets('calls logout on button press', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();
			
			when(() => mockAuthCubit.logout()).thenReturn(null);
			
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>.value(
						value: mockAuthCubit,
						child: HomeScreen(),
					),
				),
			);
			
			await tester.tap(find.widgetWithText(ElevatedButton, 'Logout'));
			
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
