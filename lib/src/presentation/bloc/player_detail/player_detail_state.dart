import 'package:equatable/equatable.dart';

import '../../../data/models/team.dart';

abstract class PlayerDetailState extends Equatable {
  const PlayerDetailState();

  @override
  List<Object?> get props => [];
}

class PlayerDetailStateInitial extends PlayerDetailState {}

class PlayerDetailStateLoading extends PlayerDetailState {}

class PlayerDetailStateSuccess extends PlayerDetailState {
  final List<Team> team;

  const PlayerDetailStateSuccess(this.team);
}

class PlayerDetailStateFail extends PlayerDetailState {
  const PlayerDetailStateFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
