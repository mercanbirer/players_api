import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/domain/usecases/player_usecase.dart';
import 'package:player/src/presentation/bloc/player/player_event.dart';
import 'package:player/src/presentation/bloc/player/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayerUseCase useCase;

  PlayerBloc(this.useCase) : super(PlayerStateInitial()) {
    on<PlayerEvent>((event, emit) async {
      emit(PlayerStateLoading());

      final mList = await useCase.playerList();
      emit(PlayerStateSuccess(mList));
    });
  }
}
