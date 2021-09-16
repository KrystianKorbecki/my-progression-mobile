// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AerobicExercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AerobicExercise _$AerobicExerciseFromJson(Map<String, dynamic> json) {
  return AerobicExercise(
    id: json['id'] as int?,
    distance: json['distance'] as String,
    maxSpeed: json['maxSpeed'] as String,
    avgSpeed: json['avgSpeed'] as String,
    minSpeed: json['minSpeed'] as String,
  );
}

Map<String, dynamic> _$AerobicExerciseToJson(AerobicExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'distance': instance.distance,
      'maxSpeed': instance.maxSpeed,
      'avgSpeed': instance.avgSpeed,
      'minSpeed': instance.minSpeed,
    };
