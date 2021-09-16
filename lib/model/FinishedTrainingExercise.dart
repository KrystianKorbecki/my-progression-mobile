import 'package:json_annotation/json_annotation.dart';

part 'FinishedTrainingExercise.g.dart';

final String tableFinishedTrainingExercise = 'finished_training_exercise';

class FinishedTrainingExerciseFields {
  static final String id = 'id';
  static final String scheduledTrainingExercise =
      'id_schedule_training_exercise';
  static final String finishedTraining = 'id_finished_training';
  static final String exerciseDetails = 'id_exercise_details';

  static final List<String> values = [
    id,
    scheduledTrainingExercise,
    finishedTraining,
    exerciseDetails
  ];
}

@JsonSerializable()
class FinishedTrainingExercise {
  final int? id;
  final int? scheduledTrainingExercise;
  final int? finishedTraining;
  final int? exerciseDetails;

  FinishedTrainingExercise(
      {this.id,
      this.scheduledTrainingExercise,
      this.finishedTraining,
      this.exerciseDetails});

  FinishedTrainingExercise copy(
          {int? id,
          int? scheduledTrainingExercise,
          int? finishedTraining,
          int? exerciseDetails}) =>
      FinishedTrainingExercise(
          id: id ?? this.id,
          scheduledTrainingExercise:
              scheduledTrainingExercise ?? this.scheduledTrainingExercise,
          finishedTraining: finishedTraining ?? this.finishedTraining,
          exerciseDetails: exerciseDetails ?? this.exerciseDetails);

  factory FinishedTrainingExercise.fromJson(Map<String, dynamic> json) =>
      _$FinishedTrainingExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedTrainingExerciseToJson(this);
}
