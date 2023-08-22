import '../../data/models/player.dart';

abstract class ApiRepository {

  Future<List<Player>> playerList();
}

//interface, pattern ve unit testler için