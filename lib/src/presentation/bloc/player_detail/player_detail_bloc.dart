import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_event.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_state.dart';
import '../../../domain/usecases/player_usecase.dart';

class PlayerDetailBloc extends Bloc<PlayerDetailEvent, PlayerDetailState> {
  final PlayerUseCase useCase;

  PlayerDetailBloc(this.useCase) : super(PlayerDetailStateInitial()) {
    on<OnPlayerDetailEvent>((event, emit) async {
      emit(PlayerDetailStateLoading());

      final mList = await useCase.playerDetailList();
      emit(PlayerDetailStateSuccess(mList));
    });
  }
}