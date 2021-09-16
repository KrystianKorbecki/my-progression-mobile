// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FinishedTraining.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedTraining _$FinishedTrainingFromJson(Map<String, dynamic> json) {
  return FinishedTraining(
    id: json['id'] as int?,
    scheduledTrainingPlan: json['scheduledTrainingPlan'] as int?,
    note: json['note'] as String?,
    finishDate: DateTime.parse(json['finishDate'] as String),
    durationSecond: json['durationSecond'] as int,
  );
}

Map<String, dynamic> _$FinishedTrainingToJson(FinishedTraining instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduledTrainingPlan': instance.scheduledTrainingPlan,
      'note': instance.note,
      'finishDate': instance.finishDate.toIso8601String(),
      'durationSecond': instance.durationSecond,
    };
