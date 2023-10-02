// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class AttachmentResponse extends Equatable implements DataResponse<Attachment> {
  final String id;
  final String? filename;
  final String? url;

  const AttachmentResponse({
    required this.id,
    this.filename,
    this.url,
  });

  @override
  Attachment toDomain() {
    return Attachment(
      id: id,
      filename: filename.orEmpty(),
      url: '${Constants.messageImagePath}$url',
    );
  }

  factory AttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachmentResponseFromJson(json);

  @override
  List<Object?> get props => [id, filename, url];
}
