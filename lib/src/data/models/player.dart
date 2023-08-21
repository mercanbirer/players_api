import 'package:json_annotation/json_annotation.dart';
import 'package:player/src/data/models/team.dart';

@JsonSerializable()
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

  factory Player.fromJson(Map<String, dynamic> json) {
    return _$PlayerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlayerFromToJson(this);

  Map<String, dynamic> _$PlayerFromToJson(Player instance) => <String, dynamic>{
        'id': instance.id,
        'firstName': instance.firstName,
        'heightFeet': instance.heightFeet,
        'heightInches': instance.heightInches,
        'lastName': instance.lastName,
        'position': instance.position,
        'team': instance.team,
      };
}

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json["id"] != null ? json["id"] as int : null,
      firstName: json["first_name"] as String?,
      heightFeet:
          json["height_feet"] != null ? json["height_feet"] as int : null,
      heightInches:
          json["height_inches"] != null ? json["height_inches"] as int : null,
      lastName: json["last_name"] as String?,
      position: json["position"] as String?,
      team: json["team"] != null ? Team.fromJson(json["team"]) : null,
    );
