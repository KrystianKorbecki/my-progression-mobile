import 'package:json_annotation/json_annotation.dart';

part 'FinishedTraining.g.dart';

final String tableFinishedTraining = 'finished_training';

class FinishedTrainingFields {
  static final String id = 'id';
  static final String scheduledTrainingPlan = 'id_scheduled_training_plan';
  static final String note = 'note';
  static final String finishDate = 'finish_date';
  static final String durationSecond = 'duration_second';

  static final List<String> values = [
    id,
    scheduledTrainingPlan,
    note,
    finishDate,
    durationSecond
  ];
}

@JsonSerializable()
class FinishedTraining {
  final int? id;
  final int? scheduledTrainingPlan;
  final String? note;
  final DateTime finishDate;
  final int durationSecond;

  FinishedTraining(
      {this.id,
      this.scheduledTrainingPlan,
      this.note,
      required this.finishDate,
      required this.durationSecond});

  FinishedTraining copy(
          {int? id,
          int? scheduledTrainingPlan,
          String? note,
          DateTime? finishDate,
          int? durationSecond}) =>
      FinishedTraining(
          id: id ?? this.id,
          scheduledTrainingPlan:
              scheduledTrainingPlan ?? this.scheduledTrainingPlan,
          note: note ?? this.note,
          finishDate: finishDate ?? this.finishDate,
          durationSecond: durationSecond ?? this.durationSecond);

  factory FinishedTraining.fromJson(Map<String, dynamic> json) =>
      _$FinishedTrainingFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedTrainingToJson(this);
}
