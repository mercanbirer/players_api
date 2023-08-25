import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/presentation/bloc/player/player_state.dart';
import '../../../domain/usecases/player_usecase.dart';

class PlayerBloc extends Cubit<PlayerState> {
  PlayerBloc(this.useCase) : super(PlayerStateInitial()) {
    getPlayers();
  }

  final PlayerUseCase useCase;

  Future<void> getPlayers() async {
    try {
      emit(PlayerStateLoading());
      final players = await useCase.playerList();

      emit(PlayerStateSuccess(players));
    } catch (e) {
      emit(const PlayerStateFail('Error'));
    }
  }
}





