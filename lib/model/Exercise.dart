import 'package:json_annotation/json_annotation.dart';

part 'Exercise.g.dart';

final String tableExercise = 'exercise';

class ExerciseField {
  static final List<String> values = [
    id,
    name,
    photoPath,
    gifPath,
    description,
    typeOfExercise,
    bodyPart
  ];

  static final String id = 'id';
  static final String name = 'name';
  static final String photoPath = 'photo_path';
  static final String gifPath = 'gif_path';
  static final String description = 'description';
  static final String typeOfExercise = 'id_type_of_exercise';
  static final String bodyPart = 'id_body_part';
}

@JsonSerializable()
class Exercise {
  late final int? id;

  @JsonKey(name: 'id_type_of_exercise')
  late final int typeOfExercise;

  @JsonKey(name: 'id_body_part')
  late final int bodyPart;
  late final String name;
  late final String? photoPath;
  late final String? gifPath;
  late final String? description;

  Exercise(
      {this.id,
      required this.typeOfExercise,
      required this.bodyPart,
      required this.name,
      this.photoPath,
      this.gifPath,
      required this.description});

  Exercise copy(
          {int? id,
          int? typeOfExercise,
          int? bodyPart,
          String? name,
          String? photoPath,
          String? gifPath,
          String? description}) =>
      Exercise(
          id: id ?? this.id,
          typeOfExercise: typeOfExercise ?? this.typeOfExercise,
          name: name ?? this.name,
          photoPath: photoPath ?? this.photoPath,
          gifPath: gifPath ?? this.gifPath,
          description: description ?? this.description,
          bodyPart: bodyPart ?? this.bodyPart);

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
