import 'package:player/src/domain/repositories/api_repository.dart';
import '../../data/models/player.dart';
import '../../data/models/team.dart';

class PlayerUseCase {
  final ApiRepository _repository;

  PlayerUseCase(this._repository);

  Future<List<Player>> playerList() {
    return _repository.playerList();
  }

  Future<List<Team>> playerDetailList() {
    return _repository.playerDetailList();
  }
}