import 'package:json_annotation/json_annotation.dart';

part 'AerobicExercise.g.dart';

final String tableAerobicExercise = 'aerobic_exercise';

class AerobicExerciseField {
  static final String id = 'id';
  static final String distance = 'distance';
  static final String maxSpeed = 'max_speed';
  static final String avgSpeed = 'avg_speed';
  static final String minSpeed = 'min_speed';

  static final List<String> values = [
    id,
    distance,
    maxSpeed,
    avgSpeed,
    minSpeed
  ];
}

@JsonSerializable()
class AerobicExercise {
  final int? id;
  final String distance;
  final String maxSpeed;
  final String avgSpeed;
  final String minSpeed;

  AerobicExercise(
      {this.id,
      required this.distance,
      required this.maxSpeed,
      required this.avgSpeed,
      required this.minSpeed});

  AerobicExercise copy(
          {int? id,
          String? distance,
          String? maxSpeed,
          String? avgSpeed,
          String? minSpeed}) =>
      AerobicExercise(
          id: id ?? this.id,
          distance: distance ?? this.distance,
          maxSpeed: maxSpeed ?? this.maxSpeed,
          avgSpeed: avgSpeed ?? this.avgSpeed,
          minSpeed: minSpeed ?? this.minSpeed);

  factory AerobicExercise.fromJson(Map<String, dynamic> json) =>
      _$AerobicExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$AerobicExerciseToJson(this);
}
