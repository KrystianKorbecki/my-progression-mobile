// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FinishedTrainingExercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedTrainingExercise _$FinishedTrainingExerciseFromJson(
    Map<String, dynamic> json) {
  return FinishedTrainingExercise(
    id: json['id'] as int?,
    scheduledTrainingExercise: json['scheduledTrainingExercise'] as int?,
    finishedTraining: json['finishedTraining'] as int?,
    exerciseDetails: json['exerciseDetails'] as int?,
  );
}

Map<String, dynamic> _$FinishedTrainingExerciseToJson(
        FinishedTrainingExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduledTrainingExercise': instance.scheduledTrainingExercise,
      'finishedTraining': instance.finishedTraining,
      'exerciseDetails': instance.exerciseDetails,
    };
