// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/domain/entities/participant.dart';
import 'message.dart';
import 'product.dart';

class Chat {
  final String id;
  final String type;
  final String productId;
  final Product? product;
  final Message? lastMessage;
  final List<Participant> participants;
  Chat({
    required this.id,
    required this.type,
    required this.product,
    required this.productId,
    required this.lastMessage,
    required this.participants,
  });
}
