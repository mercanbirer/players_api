import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/team_entity.dart';
part 'team.g.dart';

@JsonSerializable()
class Team {
  int? id;
  String? abbreviation;
  @JsonKey(name: 'city')
  String? city;
  String? conference;
  String? division;
  @JsonKey(name: 'fullName')
  String? fullName;
  String? name;

  Team({
    this.id,
    this.abbreviation,
    this.city,
    this.conference,
    this.division,
    this.fullName,
    this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);

  TeamEntity toEntity() {
    return TeamEntity(
        id: id,
        abbreviation: abbreviation,
        city: city,
        conference: conference,
        division: division,
        fullName: fullName,
        name: name);
  }
}
