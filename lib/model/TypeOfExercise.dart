import 'package:json_annotation/json_annotation.dart';

part 'TypeOfExercise.g.dart';

final String tableTypeOfExercise = "type_of_exercise";

class TypeOfExerciseField {
  static final List<String> values = [id, name];

  static final String id = 'id';
  static final String name = 'name';
}

@JsonSerializable()
class TypeOfExercise {
  final int? id;
  final String name;

  TypeOfExercise({this.id, required this.name});

  TypeOfExercise copy({int? id, String? name}) =>
      TypeOfExercise(id: id ?? this.id, name: name ?? this.name);

  factory TypeOfExercise.fromJson(Map<String, dynamic> json) =>
      _$TypeOfExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOfExerciseToJson(this);
}
