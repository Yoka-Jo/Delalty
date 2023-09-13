import 'validations.dart';

class Input {
  final String name;
  final String type;
  final List<Validations> validations;

  Input({
    required this.name,
    required this.type,
    required this.validations,
  });
}
