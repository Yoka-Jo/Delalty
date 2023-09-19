// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class EmbedResponse extends Equatable implements DataResponse<Embed> {
  final String id;
  final String? type;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? description;
  final Map<String, dynamic>? url;

  const EmbedResponse({
    required this.id,
    this.type,
    this.title,
    this.description,
    this.url,
  });

  @override
  Embed toDomain() {
    return Embed(
      id: id,
      type: type.orEmpty(),
      title: title ?? {},
      description: description ?? {},
      url: url ?? {},
    );
  }

  factory EmbedResponse.fromJson(Map<String, dynamic> json) =>
      _$EmbedResponseFromJson(json);

  @override
  List<Object?> get props {
    return [
      id,
      type,
      title,
      description,
      url,
    ];
  }
}
