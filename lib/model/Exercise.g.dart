// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return Exercise(
    id: json['id'] as int?,
    typeOfExercise: json['id_type_of_exercise'] as int,
    bodyPart: json['id_body_part'] as int,
    name: json['name'] as String,
    photoPath: json['photoPath'] as String?,
    gifPath: json['gifPath'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'id_type_of_exercise': instance.typeOfExercise,
      'id_body_part': instance.bodyPart,
      'name': instance.name,
      'photoPath': instance.photoPath,
      'gifPath': instance.gifPath,
      'description': instance.description,
    };
