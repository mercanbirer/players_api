import 'package:flutter_test/flutter_test.dart';
import 'package:player/src/core/network/api_client.dart';
import 'package:player/src/data/repository/player_repository_impl.dart';

void main() {
  late ApiClient apiClient;
  late PlayerRepositoryImpl playerRepositoryImpl;

  setUp(() {
    apiClient = ApiClient();
    playerRepositoryImpl = PlayerRepositoryImpl(apiClient: apiClient);
  });

  test('Successfully test', () async {
    final response = await playerRepositoryImpl.playerList();

    expect(response, true);
  });

}
