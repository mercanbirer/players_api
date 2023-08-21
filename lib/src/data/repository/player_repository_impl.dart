import 'package:player/src/core/network/api_client.dart';
import 'package:player/src/data/models/team.dart';
import 'package:player/src/domain/repositories/api_repository.dart';

import '../models/player.dart';

class PlayerRepositoryImpl implements ApiRepository {
  const PlayerRepositoryImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<List<Player>> playerList() {
    return apiClient.playerList();
  }

  @override
  Future<List<Team>> playerDetailList() {
    return apiClient.playerDetailList();

  }
}