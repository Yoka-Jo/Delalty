part of 'requests.dart';

class CreateProductRequest {
  final String title;
  final String description;
  final double price;
  final int categoryId;
  final int mainImageIndex;
  final List<File> images;
  final List<ValueRequest> values;

  CreateProductRequest({
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.mainImageIndex,
    required this.images,
    required this.values,
  });
}

@JsonSerializable(createFactory: false)
class ValueRequest {
  @JsonKey(name: 'input_id')
  final String inputId;
  final dynamic value;

  ValueRequest({required this.inputId, required this.value});

  Map<String, dynamic> toJson() => _$ValueRequestToJson(this);
}
