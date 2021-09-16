import 'package:my_progression_mobile/model/BodyPart.dart';

import '../DatabaseCreator.dart';

class BodyPartEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<BodyPart> create(BodyPart bodyPart) async {
    final db = await instance.database;
    final id = await db!.insert(tableBodyPart, bodyPart.toJson());
    instance.close();
    return bodyPart.copy(id: id);
  }

  static Future<BodyPart> readBodyPart(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableBodyPart,
        columns: BodyPartField.values,
        where: '${BodyPartField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return BodyPart.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableBodyPart,
        where: '${BodyPartField.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(BodyPart bodyPart) async {
    final db = await instance.database;
    return db!.update(tableBodyPart, bodyPart.toJson(),
        where: '${BodyPartField.id} = ?', whereArgs: [bodyPart.id]);
  }

  static Future<List<BodyPart>> readAllBodyParts() async {
    final db = await instance.database;
    final result = await db!.query(tableBodyPart);
    instance.close();
    return result.map((json) => BodyPart.fromJson(json)).toList();
  }
}
