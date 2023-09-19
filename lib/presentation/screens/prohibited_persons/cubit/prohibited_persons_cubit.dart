import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/socket.dart';
import '../../../../data/requests/requests.dart';
import '../../../../domain/entities/relationship.dart';
import '../../../../domain/usecases/change_relationship_type_usecase.dart';
import '../../../../main.dart';

part 'prohibited_persons_state.dart';

@injectable
class ProhibitedPersonsCubit extends Cubit<ProhibitedPersonsState> {
  ProhibitedPersonsCubit(this._changeRelationshipTypeUseCase)
      : super(ProhibitedPersonsInitial());
  final ChangeRelationshipTypeUseCase _changeRelationshipTypeUseCase;

  static ProhibitedPersonsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<RelationShip> blockedUsers = [];

  void getBlockedUsers() {
    blockedUsers = Socket.relationships
        .where((element) => element.type == 'BLOCKED')
        .toList();
  }

  Future<void> unBlockUser(String id) async {
    emit(UnBlockUserLoading());
    final response = await _changeRelationshipTypeUseCase(
      ChangeRelationshipTypeRequest(
        type: RelationShipType.UNBLOCK.name,
        target_id: int.parse(id),
      ),
    );

    response.fold(
      (l) => emit(UnBlockUserFailure(l.message)),
      (r) {
        socket.sentData();
        getBlockedUsers();
        emit(UnBlockUserSuccess());
      },
    );
  }
}
