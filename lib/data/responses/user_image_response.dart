part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class UserImageResponse extends Equatable implements DataResponse<UserImage> {
  final String? id;
  final String? url;

  const UserImageResponse({
    required this.id,
    required this.url,
  });

  @override
  UserImage toDomain() {
    return UserImage(id: id.orEmpty(), url: url.orEmpty());
  }

  @override
  List<Object?> get props => [id, url];

  factory UserImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UserImageResponseFromJson(json);
}
