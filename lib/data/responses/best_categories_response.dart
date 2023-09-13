part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class BestCategoriesResponse extends Equatable
    implements DataResponse<BestCategories> {
  final List<String> ids;

  const BestCategoriesResponse({
    required this.ids,
  });

  @override
  BestCategories toDomain() {
    return BestCategories(ids);
  }

  @override
  List<Object?> get props => [ids];

  factory BestCategoriesResponse.fromJson(Map<String, dynamic> json) {
    print("json: $json");
    return _$BestCategoriesResponseFromJson(json);
  }
}
