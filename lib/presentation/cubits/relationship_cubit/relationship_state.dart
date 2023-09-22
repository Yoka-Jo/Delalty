part of 'relationship_cubit.dart';

sealed class RelationshipState extends Equatable {
  const RelationshipState();

  @override
  List<Object> get props => [];
}

final class RelationshipInitial extends RelationshipState {}

final class ChangeRelationshipLoading extends RelationshipState {}

final class ChangeRelationshipSuccess extends RelationshipState {}

final class ChangeRelationshipFailure extends RelationshipState {
  final String message;
  const ChangeRelationshipFailure(this.message);
}

final class RemoveRelationshipLoading extends RelationshipState {}

final class RemoveRelationshipSuccess extends RelationshipState {}

final class RemoveRelationshipFailure extends RelationshipState {
  final String message;
  const RemoveRelationshipFailure(this.message);
}
