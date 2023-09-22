import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/base_usecase.dart';
import '../../core/network/failure.dart';
import '../../data/requests/requests.dart';
import '../../domain/entities/message.dart';
import '../repository/repository.dart';

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
