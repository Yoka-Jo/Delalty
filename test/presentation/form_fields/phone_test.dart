import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/core/form_fields/phone.dart';

void main() {
  const phoneString = '01023215468';
  group("Phone", () {
    group('constructors', () {
      test('unvalidated creates correct instance', () {
        const phone = Phone.unvalidated();
        expect(phone.value, '');
        expect(phone.isPure, true);
      });

      test('validated creates correct instance', () {
        const phone = Phone.validated(phoneString);
        expect(phone.value, phoneString);
        expect(phone.isPure, false);
      });
    });

    group('validator', () {
      test(
        'returns empty error when phoneNumber is empty',
        () =>
            expect(const Phone.validated('').error, PhoneValidationError.empty),
      );

      test(
        'returns invalid error when phoneNumber is invalid',
        () => expect(const Phone.validated('y01020854645').error,
            PhoneValidationError.invalid),
      );
      test(
        'valid when phoneNumber is not empty , not alreadyTaken',
        () => expect(
          const Phone.validated(phoneString).error,
          isNull,
        ),
      );
    });
  });
}
