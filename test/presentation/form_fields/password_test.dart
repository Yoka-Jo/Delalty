import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/core/form_fields/password.dart';

void main() {
  const passwordString = 'mock-password';
  group('Password', () {
    group('constructors', () {
      test('unvalidated creates correct instance', () {
        const password = Password.unvalidated();
        expect(password.value, '');
        expect(password.isPure, true);
      });

      test('validated creates correct instance', () {
        const password = Password.validated(passwordString);
        expect(password.value, passwordString);
        expect(password.isPure, false);
      });
    });
    group('validator', () {
      test(
          'returns empty error when password is empty',
          () => expect(const Password.validated('').error,
              PasswordValidationError.empty));
      test(
          'valid when password is not empty',
          () => expect(
                const Password.validated(passwordString).error,
                isNull,
              ));
    });
  });
}
