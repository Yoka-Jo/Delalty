import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/core/form_fields/username.dart';

void main() {
  const usernameString = 'mock1-username';
  group("Username", () {
    group('constructors', () {
      test('unvalidated creates correct instance', () {
        const username = Username.unvalidated();
        expect(username.value, '');
        expect(username.isPure, true);
      });

      test('validated creates correct instance', () {
        const username = Username.validated(usernameString);
        expect(username.value, usernameString);
        expect(username.isPure, false);
      });
    });

    group('validator', () {
      test(
        'returns empty error when username is empty',
        () => expect(
            const Username.validated('').error, UsernameValidationError.empty),
      );

      test(
        'returns alreadyTaken error when username is alreadyTaken',
        () => expect(
            const Username.validated(usernameString, isAlreadyRegistered: true)
                .error,
            UsernameValidationError.alreadyTaken),
      );
      test(
        'valid when username is not empty , not alreadyTaken',
        () => expect(
          const Username.validated(usernameString).error,
          isNull,
        ),
      );
    });
  });
}
