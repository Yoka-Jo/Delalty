import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/core/form_fields/password.dart';
import 'package:delalty/core/form_fields/password_confirmation.dart';

void main() {
  const password = Password.validated('mock-password');
  const confirmPasswordString = 'mock-password';
  group('Confirm Password', () {
    group('constructors', () {
      test('unvalidated creates correct instance', () {
        const confirmPassword = PasswordConfirmation.unvalidated();
        expect(confirmPassword.value, '');
        expect(confirmPassword.isPure, true);
      });

      test('validated creates correct instance', () {
        const confirmPassword = PasswordConfirmation.validated(
            confirmPasswordString,
            password: password);
        expect(confirmPassword.value, confirmPasswordString);
        expect(confirmPassword.isPure, false);
      });
    });
    group('validator', () {
      test(
          'returns empty error when password is empty',
          () => expect(
              const PasswordConfirmation.validated('', password: password)
                  .error,
              PasswordConfirmationValidationError.empty));

      test(
        "return invalid when confirm password doesn't match password",
        () => expect(
          const PasswordConfirmation.validated(
            'mockkkk-password',
            password: password,
          ).error,
          PasswordConfirmationValidationError.invalid,
        ),
      );
      test(
        'valid when confirm password is matching ',
        () => expect(
          const PasswordConfirmation.validated(confirmPasswordString,
                  password: password)
              .error,
          isNull,
        ),
      );
    });
  });
}
