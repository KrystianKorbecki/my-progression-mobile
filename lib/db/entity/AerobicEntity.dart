import 'package:my_progression_mobile/model/AerobicExercise.dart';

import '../DatabaseCreator.dart';

class AerobicExerciseEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<AerobicExercise> create(AerobicExercise aerobicExercise) async {
    final db = await instance.database;
    final id = await db!.insert(tableAerobicExercise, aerobicExercise.toJson());
    instance.close();
    return aerobicExercise.copy(id: id);
  }

  static Future<AerobicExercise> readAerobicExercise(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableAerobicExercise,
        columns: AerobicExerciseField.values,
        where: '${AerobicExerciseField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return AerobicExercise.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableAerobicExercise,
        where: '${AerobicExerciseField.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(AerobicExercise aerobicExercise) async {
    final db = await instance.database;
    return db!.update(tableAerobicExercise, aerobicExercise.toJson(),
        where: '${AerobicExerciseField.id} = ?',
        whereArgs: [aerobicExercise.id]);
  }

  static Future<List<AerobicExercise>> readAllAerobicExercise() async {
    final db = await instance.database;
    final result = await db!.query(tableAerobicExercise);
    instance.close();
    return result.map((json) => AerobicExercise.fromJson(json)).toList();
  }
}
