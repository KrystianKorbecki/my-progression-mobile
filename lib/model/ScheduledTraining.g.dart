// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ScheduledTraining.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduledTraining _$ScheduledTrainingFromJson(Map<String, dynamic> json) {
  return ScheduledTraining(
    id: json['id'] as int?,
    nextExercise: json['nextExercise'] as int?,
    exercise: json['exercise'] as int,
    scheduledTrainingPlan: json['scheduledTrainingPlan'] as int,
    exerciseDetails: json['exerciseDetails'] as int?,
  );
}

Map<String, dynamic> _$ScheduledTrainingToJson(ScheduledTraining instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nextExercise': instance.nextExercise,
      'exercise': instance.exercise,
      'scheduledTrainingPlan': instance.scheduledTrainingPlan,
      'exerciseDetails': instance.exerciseDetails,
    };
