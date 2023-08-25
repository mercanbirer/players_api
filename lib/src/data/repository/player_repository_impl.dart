import '../../core/network/api_client.dart';
import '../../domain/repositories/api_repository.dart';
import '../models/player.dart';

class PlayerRepositoryImpl implements ApiRepository {
  const PlayerRepositoryImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<List<Player>> playerList() {
    return apiClient.playerList();
  }
}