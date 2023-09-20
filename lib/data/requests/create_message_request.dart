part of 'requests.dart';

class CreateMessageRequest {
  final String chatId;
  final String content;

  final List<File> files;

  CreateMessageRequest({
    required this.chatId,
    required this.content,
    required this.files,
  });
}
