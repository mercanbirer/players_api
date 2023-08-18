import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class OnPlayerEvent extends PlayerEvent {
  const OnPlayerEvent();

  @override
  List<Object> get props => [];
}
