part of '../../core/models/responses.dart';

@JsonSerializable()
class RelationShipTargetResponse extends Equatable
    implements DataResponse<RelationShipTarget> {
  final String id;
  final String? name;
  @JsonKey(name: 'is_admin')
  final bool? isAdmin;
  @JsonKey(name: 'is_company')
  final bool? isCompany;
  final String? image;
  final SellerResponse? seller;

  const RelationShipTargetResponse({
    required this.id,
    this.name,
    this.isAdmin,
    this.isCompany,
    this.image,
    this.seller,
  });

  @override
  RelationShipTarget toDomain() {
    return RelationShipTarget(
      id: id,
      name: name.orEmpty(),
      isAdmin: isAdmin.orFalse(),
      isCompany: isCompany.orFalse(),
      image: '${Constants.userImagePath}$image',
      seller: seller?.toDomain(),
    );
  }

  factory RelationShipTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$RelationShipTargetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RelationShipTargetResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        isAdmin,
        isCompany,
        image,
        seller,
      ];
}
