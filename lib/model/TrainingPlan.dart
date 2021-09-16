import 'package:json_annotation/json_annotation.dart';

part 'TrainingPlan.g.dart';

final String tableTrainingPlan = 'training_plans';

class TrainingPlanField {
  static final List<String> values = [id, nextTrainingPlan, name, description];

  static final String id = 'id';
  static final String nextTrainingPlan = 'id_next_training_plan';
  static final String name = 'name';
  static final String description = 'description';
  static final String scheduledDate = 'scheduled_date';
}

@JsonSerializable()
class TrainingPlan {
  final int? id;
  @JsonKey(name: 'id_next_training_plan')
  final int? nextTrainingPlan;
  final String name;
  final String description;

  TrainingPlan(
      {this.id,
      required this.nextTrainingPlan,
      required this.name,
      required this.description});

  TrainingPlan copy(
          {int? id,
          int? idNextTrainingPlan,
          String? name,
          String? description}) =>
      TrainingPlan(
          id: id ?? this.id,
          nextTrainingPlan: idNextTrainingPlan ?? this.nextTrainingPlan,
          name: name ?? this.name,
          description: description ?? this.description);

  factory TrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$TrainingPlanFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingPlanToJson(this);
}
