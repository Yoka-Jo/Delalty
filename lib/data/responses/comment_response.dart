part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class CommentResponse extends Equatable implements DataResponse<Comment> {
  final String? id;
  @JsonKey(name: 'product_id')
  final String? productId;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'reference_id')
  final String? referenceId;
  final String? content;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'replies_count')
  final int? repliesCount;
  final UserResponse? user;

  const CommentResponse({
    required this.id,
    required this.productId,
    required this.userId,
    required this.referenceId,
    required this.content,
    required this.createdAt,
    required this.repliesCount,
    required this.user,
  });

  @override
  Comment toDomain() {
    return Comment(
        id: id.orEmpty(),
        productId: productId.orEmpty(),
        userId: userId.orEmpty(),
        referenceId: referenceId.orEmpty(),
        content: content.orEmpty(),
        createdAt: createdAt.orEmpty(),
        repliesCount: repliesCount.orZero(),
        user: user?.toDomain());
  }

  @override
  List<Object?> get props => [
        id,
        productId,
        userId,
        referenceId,
        content,
        createdAt,
        repliesCount,
        user
      ];

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);
}
