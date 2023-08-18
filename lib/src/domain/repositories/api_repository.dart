import '../../data/models/player.dart';
import '../../data/models/team.dart';

abstract class ApiRepository {

  Future<List<Player>> playerList();

  Future<List<Team>> playerDetailList();
}