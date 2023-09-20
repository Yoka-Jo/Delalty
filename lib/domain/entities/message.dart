// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'attachment.dart';
import 'embed.dart';

class Message {
  final String id;
  final String chatId;
  final String authorId;
  final String content;
  final String nonce;
  final String createdAt;
  final String updatedAt;
  final List<Embed> embeds;
  final List<Attachment> attachments;
  Message({
    required this.id,
    required this.chatId,
    required this.authorId,
    required this.content,
    required this.nonce,
    required this.createdAt,
    required this.updatedAt,
    required this.embeds,
    required this.attachments,
  });
}
