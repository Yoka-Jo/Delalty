import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../resources/strings_manager.dart';

class Phone extends FormzInput<String, PhoneValidationError>
    with EquatableMixin {
  const Phone.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const Phone.validated([
    String value = '',
  ]) : super.dirty(value);

  static final _phoneRegex = RegExp(r'(^01[0-2,5]{1}[0-9]{8}$)');

  @override
  PhoneValidationError? validator(String value) {
    if (value.isEmpty) {
      return PhoneValidationError.empty;
    } else if (!_phoneRegex.hasMatch(value)) {
      return PhoneValidationError.invalid;
    }
    return null;
  }

  @override
  List<Object?> get props => [value, isPure];
}

enum PhoneValidationError {
  empty(AppStrings.fillField),
  invalid(AppStrings.phoneInvalid);

  const PhoneValidationError(this.value);
  final String value;
}
