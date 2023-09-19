// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ParticipantResponse extends Equatable
    implements DataResponse<Participant> {
  @JsonKey(name: 'last_message_read_id')
  final String lastMessageReadId;
  @JsonKey(name: 'is_chat_owner')
  final bool? isChatOwner;
  final UserResponse? user;

  const ParticipantResponse({
    required this.lastMessageReadId,
    this.isChatOwner,
    this.user,
  });

  @override
  Participant toDomain() {
    return Participant(
      lastMessageReadId: lastMessageReadId,
      isChatOwner: isChatOwner.orFalse(),
      user: user?.toDomain(),
    );
  }

  factory ParticipantResponse.fromJson(Map<String, dynamic> json) =>
      _$ParticipantResponseFromJson(json);

  @override
  List<Object?> get props => [lastMessageReadId, isChatOwner, user];
}
