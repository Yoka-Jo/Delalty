import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/core/form_fields/optional_password.dart';
import 'package:delalty/core/form_fields/optional_password_confirmation.dart';

void main() {
  const optionalPassword = OptionalPassword.validated('mock-password');
  const confirmOptionalPasswordString = 'mock-password';
  group('Confirm Optional Password', () {
    group('constructors', () {
      test('unvalidated creates correct instance', () {
        const confirmOptionalPassword =
            OptionalPasswordConfirmation.unvalidated();
        expect(confirmOptionalPassword.value, '');
        expect(confirmOptionalPassword.isPure, true);
      });

      test('validated creates correct instance', () {
        const confirmOptionalPassword = OptionalPasswordConfirmation.validated(
            confirmOptionalPasswordString,
            password: optionalPassword);
        expect(confirmOptionalPassword.value, confirmOptionalPasswordString);
        expect(confirmOptionalPassword.isPure, false);
      });
    });
    group('validator', () {
      test(
          'returns empty error when confirm optional password is empty',
          () => expect(
              const OptionalPasswordConfirmation.validated(
                '',
                password: optionalPassword,
              ).error,
              OptionalPasswordConfirmationValidationError.empty));

      test(
        "return invalid when confirm optional password doesn't match optional password",
        () => expect(
          const OptionalPasswordConfirmation.validated(
            'mockkkk-password',
            password: optionalPassword,
          ).error,
          OptionalPasswordConfirmationValidationError.invalid,
        ),
      );
      test(
        'valid when confirm optional password is matching ',
        () => expect(
          const OptionalPasswordConfirmation.validated(
            confirmOptionalPasswordString,
            password: optionalPassword,
          ).error,
          isNull,
        ),
      );
    });
  });
}
