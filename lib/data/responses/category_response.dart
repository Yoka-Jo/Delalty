part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class CategoryResponse extends Equatable implements DataResponse<Category> {
  final String id;
  final String? name;
  final String? image;
  @JsonKey(name: 'parent_id')
  final String? parentId;
  final List<InputResponse>? inputs;

  const CategoryResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.inputs,
  });

  @override
  Category toDomain() {
    return Category(
        id: id,
        name: name.orEmpty(),
        image: image == null ? '' : "${Constants.categoryImagePath}$image",
        parentId: parentId.orEmpty(),
        inputs: inputs?.map((item) => item.toDomain()).toList() ?? []);
  }

  @override
  List<Object?> get props => [id, name, image, parentId, inputs];

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
