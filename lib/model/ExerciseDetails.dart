import 'package:json_annotation/json_annotation.dart';

part 'ExerciseDetails.g.dart';

final String tableExerciseDetails = 'exercise_details';

class ExerciseDetailsFields {
  static final String id = 'id';
  static final String aerobicExercise = 'id_aerobic_exercise';
  static final String note = 'note';
  static final String calories = 'calories';
  static final String duration = 'duration';
  static final String weight = 'weight';
  static final String repeat = 'repeat';
  static final String rest = 'rest';

  static final List<String> values = [
    id,
    aerobicExercise,
    note,
    calories,
    duration,
    weight,
    repeat,
    rest
  ];
}

@JsonSerializable()
class ExerciseDetails {
  final int? id;
  final int? aerobicExercise;
  final String? note;
  final String? calories;
  final String? duration;
  final String? weight;
  final String? repeat;
  final String? rest;

  ExerciseDetails(
      {this.id,
      this.aerobicExercise,
      this.note,
      this.calories,
      this.duration,
      this.weight,
      this.repeat,
      this.rest});

  ExerciseDetails copy(
          {int? id,
          int? aerobicExercise,
          String? note,
          String? calories,
          String? duration,
          String? weight,
          String? repeat}) =>
      ExerciseDetails(
          id: id ?? this.id,
          aerobicExercise: aerobicExercise ?? this.aerobicExercise,
          note: note ?? this.note,
          calories: calories ?? this.calories,
          duration: duration ?? this.duration,
          weight: weight ?? this.weight,
          repeat: repeat ?? this.repeat,
          rest: rest ?? this.rest);

  factory ExerciseDetails.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDetailsToJson(this);
}
