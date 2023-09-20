part of 'requests.dart';

enum CreateChatTypes { DIRECT, PRODUCT }

@JsonSerializable(createFactory: false)
class CreateChatRequest {
  @JsonKey(name: 'recipient_id')
  final int recipientId;
  final String type;
  @JsonKey(name: 'product_id')
  final int productId;

  CreateChatRequest({
    required this.recipientId,
    required this.type,
    required this.productId,
  });

  Map<String, dynamic> toJson() => _$CreateChatRequestToJson(this);
}
