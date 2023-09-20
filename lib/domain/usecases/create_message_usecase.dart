import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/message.dart';

@lazySingleton
class CreateMessageUseCase
    implements BaseUseCase<Message, CreateMessageRequest> {
  final Repository _repo;
  CreateMessageUseCase(this._repo);

  @override
  Future<Either<Failure, Message>> call(CreateMessageRequest params) async =>
      _repo.createMessage(params);
}
