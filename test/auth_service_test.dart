import 'package:flutter_test/flutter_test.dart';
import 'package:cosmetic/services/auth_service.dart';

void main() {
  group('AuthService Test', () {
    test('Login Test - Success', () async {
      // Replace with actual email and password for the test
      const email = 'test@example.com';
      const password = 'password123';

      final authService = AuthService();

      // Call the login method
      final result = await authService.login(email, password);

      // Check if login was successful
      expect(result, isTrue);
    });

    test('Login Test - Failure', () async {
      // Replace with incorrect email and password for the test
      const email = 'wrong@example.com';
      const password = 'wrongpassword';

      final authService = AuthService();

      // Call the login method
      final result = await authService.login(email, password);

      // Check if login failed
      expect(result, isFalse);
    });
  });
}
