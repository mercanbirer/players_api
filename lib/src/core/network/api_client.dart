import 'package:dio/dio.dart';
import 'package:player/src/injector.dart';
import '../../data/models/player.dart';

class ApiClient {
  final  _dio = injector<Dio>();
  final String _url = 'https://www.balldontlie.io/api/v1';

  Future<List<Player>> playerList() async {
    try {
      Response response = await _dio.get("$_url/players");
      final players = (response.data["data"] as List).map((e) => Player.fromJson(e)).toList();
      return players;
    } catch (e) {
      rethrow;
    }
  }
}
