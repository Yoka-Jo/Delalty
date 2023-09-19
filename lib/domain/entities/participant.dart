// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/domain/entities/user.dart';

class Participant {
  final String lastMessageReadId;
  final bool isChatOwner;
  final User? user;
  Participant({
    required this.lastMessageReadId,
    required this.isChatOwner,
    required this.user,
  });
}
