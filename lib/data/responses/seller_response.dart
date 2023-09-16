part of '../../core/models/responses.dart';

@JsonSerializable()
class SellerResponse extends Equatable implements DataResponse<Seller> {
  final String? id;
  final bool? verified;
  final UserResponse? user;

  const SellerResponse({
    required this.id,
    required this.verified,
    required this.user,
  });

  @override
  Seller toDomain() {
    return Seller(
        id: id.orEmpty(), verified: verified.orFalse(), user: user?.toDomain());
  }

  @override
  List<Object?> get props => [id, verified, user];

  factory SellerResponse.fromJson(Map<String, dynamic> json) =>
      _$SellerResponseFromJson(json);

      Map<String, dynamic> toJson() => _$SellerResponseToJson(this);
}
