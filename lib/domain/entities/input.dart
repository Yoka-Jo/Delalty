// ignore_for_file: public_member_api_docs, sort_constructors_first

class Input {
  final String id;
  final String name;
  final String type;
  final Map<String, dynamic> validations;
  final bool isRequired;

  Input({
    required this.id,
    required this.name,
    required this.type,
    required this.validations,
    required this.isRequired,
  });
}
