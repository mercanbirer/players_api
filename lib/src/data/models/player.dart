import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/player_entity.dart';
import 'team.dart';
part 'player.g.dart';

@JsonSerializable()
class Player {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'heightFeet')
  dynamic heightFeet;
  @JsonKey(name: 'heightInches')
  dynamic heightInches;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'position')
  String? position;
  @JsonKey(name: 'weightPounds')
  dynamic weightPounds;
  @JsonKey(name: 'team')
  Team? team;

  Player({
    this.id,
    this.firstName,
    this.heightFeet,
    this.heightInches,
    this.lastName,
    this.position,
    this.team,
    this.weightPounds,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  PlayerEntity toEntity() {
    return PlayerEntity(
        id: id,
        firstName: firstName,
        heightFeet: heightFeet,
        heightInches: heightInches,
        lastName: lastName,
        position: position,
        team: team?.toEntity(),
        weightPounds: weightPounds);
  }

  @override
  bool get operator => true;
}
