import 'package:json_annotation/json_annotation.dart';

part 'BodyPart.g.dart';

final String tableBodyPart = "body_part";

class BodyPartField {
  static final List<String> values = [id, name];

  static final String id = 'id';
  static final String name = 'name';
}

@JsonSerializable()
class BodyPart {
  final int? id;
  final String name;

  BodyPart({this.id, required this.name});

  BodyPart copy({int? id, String? name}) =>
      BodyPart(id: id ?? this.id, name: name ?? this.name);

  factory BodyPart.fromJson(Map<String, dynamic> json) =>
      _$BodyPartFromJson(json);

  Map<String, dynamic> toJson() => _$BodyPartToJson(this);
}
