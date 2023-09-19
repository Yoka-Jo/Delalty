// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ChatResponse extends Equatable implements DataResponse<Chat> {
  final String id;
  final String? type;
  @JsonKey(name: 'product_id')
  final String productId;
  @JsonKey(name: 'last_message')
  final MessageResponse? lastMessage;
  final List<ParticipantResponse>? participants;

  const ChatResponse({
    required this.id,
    required this.productId,
    this.type,
    this.lastMessage,
    this.participants,
  });

  @override
  Chat toDomain() {
    return Chat(
      id: id,
      type: type.orEmpty(),
      productId: productId,
      lastMessage: lastMessage?.toDomain(),
      participants: participants?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  @override
  List<Object?> get props {
    return [
      id,
      type,
      productId,
      lastMessage,
      participants,
    ];
  }
}
