import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/core/form_fields/email.dart';

void main() {
  const emailString = 'mock2@mock.com';
  group('Email', () {
    group('constructors', () {
      test('unvalidated creates correct instance', () {
        const email = Email.unvalidated();
        expect(email.value, '');
        expect(email.isPure, true);
      });

      test('validated creates correct instance', () {
        const email = Email.validated(emailString);
        expect(email.value, emailString);
        expect(email.isPure, false);
      });
    });
    group('validator', () {
      test(
          'returns empty error when email is empty',
          () => expect(
              const Email.validated('').error, EmailValidationError.empty));
      test(
          'valid when email is not empty',
          () => expect(
                const Email.validated(emailString).error,
                isNull,
              ));
    });
  });
}
