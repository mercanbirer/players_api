import 'package:equatable/equatable.dart';

abstract class PlayerDetailEvent extends Equatable {
  const PlayerDetailEvent();

  @override
  List<Object> get props => [];
}

class OnPlayerDetailEvent extends PlayerDetailEvent {
  const OnPlayerDetailEvent();

  @override
  List<Object> get props => [];
}
