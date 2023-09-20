import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/message.dart';

@lazySingleton
class GetMessagesUseCase
    implements BaseUseCase<List<Message>, GetMessagesRequest> {
  final Repository _repo;
  GetMessagesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Message>>> call(
          GetMessagesRequest params) async =>
      _repo.getMessages(params);
}
