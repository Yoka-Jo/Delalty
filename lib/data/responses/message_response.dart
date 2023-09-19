// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class MessageResponse extends Equatable implements DataResponse<Message> {
  final String id;
  @JsonKey(name: "chat_id")
  final String chatId;
  final String? content;
  final String? nonce;
  @JsonKey(name: 'created_at')
  final Map<String, dynamic>? createdAt;
  @JsonKey(name: 'updated_at')
  final Map<String, dynamic>? updatedAt;
  final List<EmbedResponse>? embeds;
  final List<AttachmentResponse>? attachments;

  const MessageResponse({
    required this.id,
    required this.chatId,
    this.content,
    this.nonce,
    this.createdAt,
    this.updatedAt,
    this.embeds,
    this.attachments,
  });

  @override
  Message toDomain() {
    return Message(
      id: id,
      chatId: chatId,
      content: content.orEmpty(),
      nonce: nonce.orEmpty(),
      createdAt: createdAt ?? {},
      updatedAt: updatedAt ?? {},
      embeds: embeds?.map((e) => e.toDomain()).toList() ?? [],
      attachments: attachments?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  @override
  List<Object?> get props {
    return [
      id,
      chatId,
      content,
      nonce,
      createdAt,
      updatedAt,
      embeds,
      attachments,
    ];
  }
}
