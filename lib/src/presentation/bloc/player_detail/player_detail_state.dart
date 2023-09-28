import 'package:equatable/equatable.dart';
import '../../../data/models/player.dart';

abstract class PlayerDetailState extends Equatable {
  const PlayerDetailState();

  @override
  List<Object?> get props => [];
}

class PlayerDetailStateInitial extends PlayerDetailState {}

class PlayerDetailStateLoading extends PlayerDetailState {}

class PlayerDetailStateSuccess extends PlayerDetailState {
  List<Player> player;
  PlayerDetailStateSuccess({required this.player});
}
class PlayerDetailStateFail extends PlayerDetailState {
  const PlayerDetailStateFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}