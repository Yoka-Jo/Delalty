import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/requests/requests.dart';
import '../../../domain/usecases/change_relationship_type_usecase.dart';
import '../../../domain/usecases/remove_relationship_usecase.dart';

part 'relationship_state.dart';

@injectable
class RelationshipCubit extends Cubit<RelationshipState> {
  RelationshipCubit(
    this._changeRelationshipTypeUseCase,
    this._removeRelationshipUseCase,
  ) : super(RelationshipInitial());
  final ChangeRelationshipTypeUseCase _changeRelationshipTypeUseCase;
  final RemoveRelationshipUseCase _removeRelationshipUseCase;

  static RelationshipCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> changeRelationship(
      RelationShipType relationShipType, String userId) async {
    emit(ChangeRelationshipLoading());
    final response = await _changeRelationshipTypeUseCase(
      ChangeRelationshipTypeRequest(
        target_id: int.parse(userId),
        type: relationShipType.name,
      ),
    );

    response.fold(
      (l) => emit(ChangeRelationshipFailure(l.message)),
      (r) => emit(ChangeRelationshipSuccess()),
    );
  }

  Future<void> removeRelationship(String userId) async {
    emit(RemoveRelationshipLoading());
    final response = await _removeRelationshipUseCase(
      RemoveRelationshipRequest(target_id: userId),
    );

    response.fold(
      (l) => emit(RemoveRelationshipFailure(l.message)),
      (r) => emit(RemoveRelationshipSuccess()),
    );
  }

  Future<void> addFriend(String friendId) async {
    await changeRelationship(RelationShipType.ADD_FRIEND, friendId);
  }
}
