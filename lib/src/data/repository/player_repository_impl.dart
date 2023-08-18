import 'package:player/src/core/network/api_client.dart';
import 'package:player/src/data/models/team.dart';
import 'package:player/src/domain/repositories/api_repository.dart';

import '../models/player.dart';

class PlayerRepositoryImpl implements ApiRepository {
  const PlayerRepositoryImpl({required this.remoteDataSource});

  final ApiClient remoteDataSource;

  @override
  Future<List<Player>> playerList() {
    return remoteDataSource.playerList();
  }

  @override
  Future<List<Team>> playerDetailList() {
    return remoteDataSource.playerDetailList();

  }
}