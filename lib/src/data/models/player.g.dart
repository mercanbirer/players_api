part of 'player.dart';

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
  id: json['id'] as int?,
  firstName: json['first_name'] as String?,
  heightFeet: json['height_feet'],
  heightInches: json['height_inches'],
  lastName: json['last_name'] as String?,
  position: json['position'] as String?,
  team: json['team'] == null
      ? null
      : Team.fromJson(json['team'] as Map<String, dynamic>),
  weightPounds: json['weight_pounds'],
);

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'height_feet': instance.heightFeet,
  'height_inches': instance.heightInches,
  'last_name': instance.lastName,
  'position': instance.position,
  'team': instance.team,
  'weight_pounds': instance.weightPounds,
};