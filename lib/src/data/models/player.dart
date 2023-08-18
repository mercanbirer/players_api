  import 'package:player/src/data/models/team.dart';

class Player {
  int? id;
  String? firstName;
  int? heightFeet;
  int? heightInches;
  String? lastName;
  String? position;
  Team? team;

  Player(
      {this.id,
      this.firstName,
      this.heightFeet,
      this.heightInches,
      this.lastName,
      this.position,
      this.team});

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"] != null ? json["id"] as int : null,
        firstName: json["first_name"],
        heightFeet: json["height_feet"] != null ? json["height_feet"] as int : null,
        heightInches: json["height_inches"] != null ? json["height_inches"] as int : null,
        lastName: json["last_name"],
        position: json["position"],
        team: json["team"] != null ? Team.fromJson(json["team"]) : null,
      );
}
