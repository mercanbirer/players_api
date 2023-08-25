import '../../data/models/player.dart';
import '../repositories/api_repository.dart';

class PlayerUseCase {
  final ApiRepository _repository;

  PlayerUseCase(this._repository);

  Future<List<Player>> playerList() {
    return _repository.playerList();
  }
}