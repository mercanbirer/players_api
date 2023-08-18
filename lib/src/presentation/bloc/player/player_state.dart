import 'package:equatable/equatable.dart';

import '../../../data/models/player.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object?> get props => [];
}

class PlayerStateInitial extends PlayerState {}

class PlayerStateLoading extends PlayerState {}

class PlayerStateSuccess extends PlayerState {
  final List<Player> player;
  const PlayerStateSuccess(this.player);
}

class PlayerStateFail extends PlayerState {
  const PlayerStateFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
