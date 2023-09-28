import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/domain/usecases/player_usecase.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_state.dart';


class PlayerDetailsBloc extends Cubit<PlayerDetailState> {
  PlayerDetailsBloc(this.useCase) : super(PlayerDetailStateInitial()) {
    getPlayers();
  }

  final PlayerUseCase useCase;

  Future<void> getPlayers() async {
    try {
      emit(PlayerDetailStateLoading());
      final players = await useCase.playerList();

      emit(PlayerDetailStateSuccess(player: players));
    } catch (e) {
      emit(const PlayerDetailStateFail('Error'));
    }
  }
}