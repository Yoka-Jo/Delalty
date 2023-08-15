import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../resources/strings_manager.dart';

class Email extends FormzInput<String, EmailValidationError>
    with EquatableMixin {
  const Email.unvalidated([
    String value = '',
  ])  : isAlreadyRegistered = false,
        super.pure(value);

  const Email.validated(
    String value, {
    this.isAlreadyRegistered = false,
  }) : super.dirty(value);

  static final _emailRegex = RegExp(
    '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?'
    '[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
    '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
    ')|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
  );

  final bool isAlreadyRegistered;

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else {
      if (isAlreadyRegistered) {
        return EmailValidationError.alreadyRegistered;
      }
      if (!_emailRegex.hasMatch(value)) {
        return EmailValidationError.invalid;
      }
    }
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
        isAlreadyRegistered,
      ];
}

enum EmailValidationError {
  empty(AppStrings.fillField),
  invalid("Email provided is not valid."),
  alreadyRegistered("This email is already registered.");

  const EmailValidationError(this.value);
  final String value;
}
