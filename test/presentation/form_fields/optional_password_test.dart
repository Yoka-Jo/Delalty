import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/core/form_fields/optional_password.dart';

void main() {
  const optionalPasswordString = 'mock-password';
  group('Optional Password', () {
    group('constructors', () {
      test('unvalidated creates correct instance', () {
        const optionalPassword = OptionalPassword.unvalidated();
        expect(optionalPassword.value, '');
        expect(optionalPassword.isPure, true);
      });

      test('validated creates correct instance', () {
        const optionalPassword =
            OptionalPassword.validated(optionalPasswordString);
        expect(optionalPassword.value, optionalPasswordString);
        expect(optionalPassword.isPure, false);
      });
    });
    group('validator', () {
      test(
        'returns empty error when optinsl password is less than 5 characters',
        () => expect(
          const OptionalPassword.validated('1').error,
          OptionalPasswordValidationError.invalid,
        ),
      );
      test(
        'returns empty error when optinsl password is more than 120 characters',
        () => expect(
          OptionalPassword.validated(('1' * 121)).error,
          OptionalPasswordValidationError.invalid,
        ),
      );
      test(
          'valid when password is not empty',
          () => expect(
                const OptionalPassword.validated(optionalPasswordString).error,
                isNull,
              ));
    });
  });
}
