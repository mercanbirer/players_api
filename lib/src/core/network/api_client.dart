import 'package:dio/dio.dart';

import '../../data/models/player.dart';
import '../../data/models/team.dart';

class ApiClient {
  final Dio _dio = Dio();
  final String _url = 'https://www.balldontlie.io/api/v1';

  Future<List<Player>> playerList() async {
    try {
      Response response = await _dio.get("$_url/players");
      List<Player> players = [];
      var extractedData = response.data["data"] as List<dynamic>;
      for (var element in extractedData) {
        players.add(Player(
          firstName: element["first_name"],
          lastName: element["last_name"],
          id: element["id"],
        ));
      }
      return players;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Team>> playerDetailList() async {
    try {
      Response response = await _dio.get("$_url/teams");
      List<Team> team = [];
      var extractedData = response.data["data"] as List<dynamic>;
      for (var element in extractedData) {
        team.add(Team(
          id: element["id"],
          city: element["city"],
          name: element["name"],
        ));
      }
      return team;
    } catch (e) {
      rethrow;
    }
  }
}
