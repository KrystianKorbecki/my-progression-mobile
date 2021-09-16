import 'package:json_annotation/json_annotation.dart';

part 'ScheduledTraining.g.dart';

final String tableScheduledTraining = 'scheduled_training';

class ScheduledTrainingField {
  static final String id = 'id';
  static final String nextExercise = 'id_next_exercise';
  static final String exercise = 'id_exercise';
  static final String scheduledTrainingPlan = 'id_scheduled_training_plan';
  static final String exerciseDetails = 'id_exercise_details';
  static final String scheduledDate = 'scheduled_date';

  static final List<String> values = [
    id,
    nextExercise,
    exercise,
    scheduledTrainingPlan,
    exerciseDetails,
    scheduledDate
  ];
}

@JsonSerializable()
class ScheduledTraining {
  final int? id;
  final int? nextExercise;
  final int exercise;
  final int scheduledTrainingPlan;
  final int? exerciseDetails;

  ScheduledTraining(
      {this.id,
      this.nextExercise,
      required this.exercise,
      required this.scheduledTrainingPlan,
      this.exerciseDetails});

  ScheduledTraining copy(
          {int? id,
          int? nextExercise,
          int? exercise,
          int? scheduledTrainingPlan,
          int? exerciseDetails}) =>
      ScheduledTraining(
          id: id ?? this.id,
          nextExercise: nextExercise ?? this.nextExercise,
          exercise: exercise ?? this.exercise,
          scheduledTrainingPlan:
              scheduledTrainingPlan ?? this.scheduledTrainingPlan,
          exerciseDetails: exerciseDetails ?? this.exerciseDetails);

  factory ScheduledTraining.fromJson(Map<String, dynamic> json) =>
      _$ScheduledTrainingFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduledTrainingToJson(this);
}
