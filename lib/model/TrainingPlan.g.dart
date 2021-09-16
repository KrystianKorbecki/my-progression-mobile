// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainingPlan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingPlan _$TrainingPlanFromJson(Map<String, dynamic> json) {
  return TrainingPlan(
    id: json['id'] as int?,
    nextTrainingPlan: json['id_next_training_plan'] as int?,
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$TrainingPlanToJson(TrainingPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_next_training_plan': instance.nextTrainingPlan,
      'name': instance.name,
      'description': instance.description,
    };
