// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExerciseDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseDetails _$ExerciseDetailsFromJson(Map<String, dynamic> json) {
  return ExerciseDetails(
    id: json['id'] as int?,
    aerobicExercise: json['aerobicExercise'] as int?,
    note: json['note'] as String?,
    calories: json['calories'] as String?,
    duration: json['duration'] as String?,
    weight: json['weight'] as String?,
    repeat: json['repeat'] as String?,
    rest: json['rest'] as String?,
  );
}

Map<String, dynamic> _$ExerciseDetailsToJson(ExerciseDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aerobicExercise': instance.aerobicExercise,
      'note': instance.note,
      'calories': instance.calories,
      'duration': instance.duration,
      'weight': instance.weight,
      'repeat': instance.repeat,
      'rest': instance.rest,
    };
