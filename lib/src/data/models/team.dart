
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Team {
  int? id;
  String? abbreviation;
  String? city;
  String? conference;
  String? division;
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

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        id: json['id'],
        abbreviation: json['abbreviation'],
        city: json['city'],
        conference: json['conference'],
        division: json['division'],
        fullName: json['full_name'],
        name: json['name']);
  }
}
