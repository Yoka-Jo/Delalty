import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/chat.dart';

@lazySingleton
class CreateChatUseCase implements BaseUseCase<Chat, CreateChatRequest> {
  final Repository _repo;
  CreateChatUseCase(this._repo);

  @override
  Future<Either<Failure, Chat>> call(CreateChatRequest params) async =>
      _repo.createChat(params);
}
