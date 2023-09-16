import 'user.dart';

class Comment {
  final String id;
  final String productId;
  final String userId;
  final String referenceId;
  final String content;
  final String createdAt;
  final int repliesCount;
  final User? user;

  Comment({
    required this.id,
    required this.productId,
    required this.userId,
    required this.referenceId,
    required this.content,
    required this.createdAt,
    required this.repliesCount,
    required this.user,
  });
}
